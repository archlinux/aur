all:
	updpkgsums
	extra-x86_64-build
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf swagger2openapi-* *.log

