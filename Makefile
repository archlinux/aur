.PHONY: all

all: clean rebuild srcinfo

rebuild:
	makepkg -s

srcinfo:
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf pkg src pass-otp/ pass-otp*.tar.*
