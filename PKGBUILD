# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gomplate-git
pkgver=v3.10.0.r4.gd57887e6
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering.'
arch=(i686 x86_64)
url='https://gomplate.hairyhenderson.ca/'
license=(BSD)
conflicts=('gomplate')
provides=('gomplate')
makedepends=(go)
source=("${pkgname}::git+https://github.com/hairyhenderson/gomplate")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	install -m755 -d "${srcdir}/go/src/github.com/hairyhenderson/"
	ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	export GOPATH="${srcdir}/go"
	go get -v -d ./...
}

build() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	mkdir -p build

	export GOPATH="${srcdir}/go"
	make
}

package() {
	cd "${srcdir}/go/src/github.com/hairyhenderson/gomplate"

	install -m755 -D bin/gomplate "${pkgdir}"/usr/bin/gomplate
}
