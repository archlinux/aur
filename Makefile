all: build

build:
	@/usr/bin/makepkg

build-source:
	@/usr/bin/makepkg -S

clean: clean-downloads clean-packages clean-builds

clean-downloads:
	@rm -vf ./openvox-agent*deb

clean-packages:
	@rm -vf ./openvox-agent*tar.zst ./openvox-agent*tar.gz

clean-builds:
	@rm -rvf ./pkg ./src
