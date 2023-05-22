build-image:
	docker build -t build-byndid:latest .

build: clean
	docker run --rm -v $(shell pwd):/build --name build-byndid build-byndid:latest

test:
	docker run --rm -v $(shell pwd):/build --name build-byndid build-byndid:latest /bin/sh -c "namcap /build/*.pkg.tar.zst"

run:
	docker run -it --rm -v $(shell pwd):/build --name build-byndid build-byndid:latest /bin/bash

run-asroot:
	docker run --user=root -it --rm -v $(shell pwd):/build --name build-byndid build-byndid:latest /bin/bash

clean:
	rm -rf pkg/ src/ beyond-identity-bin-* beyond-identity-*.tar.gz

srcinfo:
	docker run -it --rm -v $(shell pwd):/build --name build-byndid build-byndid:latest /bin/sh -c "makepkg --printsrcinfo > /build/.SRCINFO"
