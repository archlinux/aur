all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	make clean

clean:
	rm -f *.tar *.zip *.zst

test:
	make clean
	makepkg
	namcap PKGBUILD
	namcap *.pkg.tar.zst

mount:
	docker run -it -v $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))/:/vol -w /vol \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		-v $(HOME)/.config/pulse/cookie:/home/user/.config/pulse/cookie:ro \
		$(shell docker build -qf .docker/Dockerfile-testarch .)
