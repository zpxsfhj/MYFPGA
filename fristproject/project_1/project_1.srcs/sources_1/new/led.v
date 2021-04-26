`timescale 1ns/1ps
module led_twinkle(
    input        clk,
    input       rst_n,
    output[1:0] led
   );
reg [25:0] cnt;
assign led = (cnt < 26'd2500_0000) ? 2'b01 : 2'b10;

always @ (posedge clk or negedge rst_n ) begin
    if(!rst_n)
        cnt<=26'd0;
    else if(cnt<26'd5000_0000)
        cnt <= cnt + 1'b1;
    else 
        cnt<= 26'd0;

end

endmodule