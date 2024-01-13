IMAGE_NAME ?= makepkg.local
IMAGE_TAG ?= latest
UID = $(shell id -u)
GID = $(shell id -g)

.PHONY: build
build: clean
	makepkg
	makepkg --printsrcinfo > .SRCINFO

.PHONY: clean
clean:
	rm -rf *.tar.* *.pkg.* src pkg

.PHONY: in-docker
in-docker: clean
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .
	docker run -it --rm \
		--volume $(PWD):/src \
		--workdir /src \
		--user $(UID):$(GID) \
		$(IMAGE_NAME):$(IMAGE_TAG) \
		make build
