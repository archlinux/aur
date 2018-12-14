# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=vg-git
_pkgname=vg
pkgver=v0.8.0.r14.gcdcc9a2
pkgrel=1
pkgdesc='Easy and powerful workspace based development for go'
arch=(x86_64)
url='https://github.com/GetStream/vg'
license=(MIT)
makedepends=(go)
source=("${_pkgname}::git+https://github.com/GetStream/vg.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"

	sed -i -re '/ifndef VIRTUALGO/,/endif/d' Makefile

	install -m755 -d "${srcdir}/go/src/github.com/GetStream/"
	ln -sf "${srcdir}/${_pkgname}" "${srcdir}/go/src/github.com/GetStream/${_pkgname}"
}

build() {
	cd "${srcdir}/go/src/github.com/GetStream/${_pkgname}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" go get -v

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" go build -o vg \
		-ldflags="-w -s -X github.com/GetStream/vg/cmd.Version=${pkgver}"
}

package() {
	cd "${srcdir}/go/src/github.com/GetStream/${_pkgname}"

	install -m755 -D vg "${pkgdir}"/usr/bin/vg
}
