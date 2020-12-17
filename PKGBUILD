# Maintainer: Utkan Güngördü <utkan@freeconsole.org>

pkgname=gomics-git
_pkgname=gomics
pkgver=r16.1501315
pkgrel=1
pkgdesc="A lightweight and free comic viewer"
url="https://github.com/salviati/gomics"
license=('GPLv3')
depends=('gtk3' 'gdk-pixbuf2' 'glib2')
makedepends=('git' 'go' 'go-bindata')
conflicts=('gomics')
provides=('gomics')
arch=('i686' 'x86_64')
source=("git://github.com/salviati/gomics.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/src/github.com/salviati/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	export GOPATH="${srcdir}"
	mkdir -p "${srcdir}/src/github.com/salviati"
	mv "${srcdir}/${_pkgname}" "${srcdir}/src/github.com/salviati/"
	cd "${srcdir}/src/github.com/salviati/gomics"
}

build() {
	export GOPATH="${srcdir}"
	cd "${srcdir}/src/github.com/salviati/gomics"
	sh make.sh
}

package() {
	cd "${srcdir}/src/github.com/salviati/gomics"
	install -Dm755 "${srcdir}/bin/gomics" "${pkgdir}/usr/bin/gomics"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
