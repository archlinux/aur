IMAGE_NAME ?= makepkg.local
IMAGE_TAG ?= latest
UID = $(shell id -u)
GID = $(shell id -g)

build: clean
	makepkg
	makepkg --printsrcinfo > .SRCINFO

clean:
	rm -rf *.tar.* *.pkg.* src pkg ./powerstation

in-docker: clean
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker run -it --rm \
		--env HOME='/home/build' \
		--volume $(PWD):/src \
		--workdir /src \
		--user $(UID):$(GID) \
		$(IMAGE_NAME):$(IMAGE_TAG) \
		make build
