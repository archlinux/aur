# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=ghw-git
pkgver=0.10.0.r10.g227643e
pkgrel=1
pkgdesc="Golang hardware discovery/inspection library"
arch=('x86_64')
url="https://github.com/jaypipes/ghw.git"
license=('Apache')
makedepends=('go>=1.10' 'git')
conflicts=('ghw')
provides=('ghw')
source=("${pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/jaypipes/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/jaypipes/ghw"

	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

    export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
    go get -v -t ./...
}

build() {
	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

    mkdir -p build

    export CGO_ENABLED=0
    export GOPATH="${srcdir}/go" GOFLAGS="-modcacherw"
    go build \
		-trimpath -ldflags "-s -w" \
		-o ./build/ghwc ./cmd/ghwc
}

package() {
	cd "${srcdir}/go/src/github.com/jaypipes/ghw"

	install -Dm755 "build/ghwc" "${pkgdir}/usr/bin/ghwc"
}
