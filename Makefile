all:
	updpkgsums
	makepkg --printsrcinfo > .SRCINFO
	rm -f *.zip
	rm -f *.zst

clean:
	rm -f *.zip
	rm -f *.zst

test:
	make clean
	makepkg --cleanbuild
	namcap PKGBUILD
	namcap *.pkg.tar.zst

mount:
	xhost +local:$(USER)
	docker run -it -w /vol \
		-v ./:/vol \
		-v /tmp/.X11-unix:/tmp/.X11-unix:ro \
		$(shell docker build -qf .docker/Dockerfile-testarch .) \
		# "yay -Sy --noconfirm --nopgpfetch python-suntime && yay -U yin-yang-*.zst && bash"
	xhost -