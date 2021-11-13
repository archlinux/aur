.PHONY: container

container:
	docker build . -t protonutils-build

build: container
	docker run -v $(shell pwd):/home/build/src protonutils-build