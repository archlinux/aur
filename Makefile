build:
	makepkg -s

docker-build:
	docker run -i -t --rm -v "$(shell pwd):/usr/local/build/src" flaccid/arch-makepkg

clean:
	rm -Rf \
		src \
		pkg \
		*.pkg.tar.* \
		.SRCINFO

clean-all:
	rm -Rf \
		containerd \
		docker \
		docker-ce \
		libnetwork \
		moby \
		runc \
		src \
		tini \
		pkg \
		*.pkg.tar.* \
		.SRCINFO
