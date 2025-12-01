.PHONY: build
build:
	@makepkg
	@makepkg --printsrcinfo

.PHONY: clean
clean:
	@rm -f kfilt*
	@rm -rf pkg src

.PHONY: image
image:
	@podman build --platform linux/amd64 -t kfilt-aur-packager .

.PHONY: image-build
image-build: #image
	@podman run --rm -it kfilt-aur-packager
