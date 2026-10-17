all: build

build:
	@/usr/bin/makepkgmakepkg

build-all: build-x86_64 build-aarch64 build-armv7h

build-source:
	@/usr/bin/makepkg -S

clean: clean-downloads clean-packages clean-builds

clean-downloads:
	@rm -vf ./openvox-agent*deb

clean-packages:
	@rm -vf ./openvox-agent*tar.zst ./openvox-agent*tar.gz

clean-builds:
	@rm -rvf ./pkg ./src

srcinfo:
	@/usr/bin/makepkg --printsrcinfo | tee .SRCINFO

build-x86_64:
	@CARCH=x86_64 /usr/bin/makepkg

build-aarch64:
	@CARCH=aarch64 /usr/bin/makepkg

build-armv7h:
	@CARCH=armv7h /usr/bin/makepkg
