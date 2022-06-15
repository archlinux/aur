all:
	make prepare
	make build

build:
	extra-x86_64-build

prepare:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf cppzmq-* *.log
