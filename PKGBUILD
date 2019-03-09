# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gomplate-git
pkgver=r747.e69cf65c
pkgrel=1
pkgdesc='A flexible commandline tool for template rendering.'
arch=(i686 x86_64)
url='https://gomplate.hairyhenderson.ca/'
license=(BSD)
makedepends=(go)
source=("${pkgname}::git+https://github.com/hairyhenderson/gomplate")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
