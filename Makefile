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
	@docker build -t kfilt-aur-packager .

.PHONY: image-build
image-build: #image
	@docker run --rm -it kfilt-aur-packager
