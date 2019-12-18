# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ghw-git
pkgver=v0.5.0.r1.g8b49aea
pkgrel=1
pkgdesc="Golang hardware discovery/inspection library"
arch=('x86_64')
url="https://github.com/jaypipes/ghw"
license=('Apache')
makedepends=('go>=1.10' 'git')
conflicts=('ghw')
provides=('ghw')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/jaypipes/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/jaypipes/ghw"

	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" \
	go get -v -d ./...
}

build() {
	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

	mkdir -p build

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" \
	go build \
		-ldflags "-s -w" \
		-gcflags="all=-trimpath=${GOPATH}/src" \
		-asmflags="all=-trimpath=${GOPATH}/src" \
		-o build/ghwc ./cmd/ghwc
}

package() {
	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

	install -Dm755 "./build/ghwc" "${pkgdir}/usr/bin/ghwc"
}
