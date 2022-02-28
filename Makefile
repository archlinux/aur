.PHONY: container

DOCKER_CMD = docker run --rm -v $(shell pwd):/home/build/src:Z
IMG = protonutils-build

container:
	docker build . -t protonutils-build

build: container
	$(DOCKER_CMD) $(IMG)

hash: container
	$(DOCKER_CMD) $(IMG) makepkg -g

shell: container
	$(DOCKER_CMD) -it $(IMG) /bin/bash

root_shell: container
	$(DOCKER_CMD) -it --user root $(IMG) /bin/bash