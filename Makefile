.SRCINFO: PKGBUILD
	docker build -t patat-bin-builder .
	docker run patat-bin-builder >.SRCINFO
