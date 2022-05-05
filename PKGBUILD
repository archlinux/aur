# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=vg-git
pkgver=0.9.0.r8.g0070ca7
pkgrel=1
pkgdesc='Easy and powerful workspace based development for go'
arch=(x86_64)
url='https://github.com/GetStream/vg'
license=(MIT)
makedepends=(go)
source=("${pkgname}::git+https://github.com/GetStream/vg.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/GetStream/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/GetStream/vg"

	cd "${srcdir}/go/src/github.com/GetStream/vg"

	sed -i -re '/ifndef VIRTUALGO/,/endif/d' Makefile

	export GOPATH="${srcdir}/go"
	go get -v ./...
}

build() {
	cd "${srcdir}/go/src/github.com/GetStream/vg"

	export GOPATH="${srcdir}/go"
	go build -o vg -trimpath -ldflags "-s -w" \
		-ldflags="-w -s -X github.com/GetStream/vg/cmd.Version=${pkgver}"
}

package() {
	cd "${srcdir}/go/src/github.com/GetStream/vg"

	install -m755 -D vg "${pkgdir}"/usr/bin/vg
}
