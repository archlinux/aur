# Maintainer: michaelkuc6 <michaelkuc6 at gmail dot com>
_pkgname=protodata
pkgname="${_pkgname}-git"
pkgver=r125.51de27b
pkgrel=1
pkgdesc="Protodata is a language for describing binary data, originally written for prototyping and reverse engineering binary file formats."
arch=('x86_64')
url="https://github.com/evincarofautumn/protodata"
license=('MIT')
depends=()
makedepends=('make')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/evincarofautumn/protodata.git"
	'nested_exception.h.patch'
)
sha256sums=(
	'SKIP'
	'96cffa0a1da8f5a1a0942e52fda7526b6b2c1dc142fd164460b6671323fbb16b'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p0 <../nested_exception.h.patch
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	install -m755 -D "${srcdir}/${_pkgname}/pd" "${pkgdir}/usr/bin/pd"
	install -m644 -D "${srcdir}/${_pkgname}/COPYING.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
