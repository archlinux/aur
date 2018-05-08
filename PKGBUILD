# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=vg-git
pkgver=v0.8.0.r11.g4e64c0f
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

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/GetStream/"
	cp -a "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/GetStream/vg"

	sed -i -re '/ifndef VIRTUALGO/,/endif/d' \
		"${srcdir}/go/src/github.com/GetStream/vg/Makefile"
}

build() {
	cd "${srcdir}/go/src/github.com/GetStream/vg"

	export GOROOT="/usr/lib/go" GOPATH="${srcdir}/go"

	go get -v
	go build -o vg \
		-ldflags="-w -s -X github.com/GetStream/vg/cmd.Version=${pkgver}"
}

package() {
	cd "${srcdir}/go/src/github.com/GetStream/vg"

	install -m755 -D vg "${pkgdir}"/usr/bin/vg
}
