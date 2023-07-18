# Maintainer: Charlotte Ausel <ettolrach@disroot.org>
# Maintainer: Echo J. <aidas957 at gmail dot com>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=r1162.01a2915
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("ZLIB")
depends=("hicolor-icon-theme" "minizip" "qt6-base" "qt6-svg")
makedepends=("cmake" "git" "qt6-tools")
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

prepare() {
	cd "${srcdir}/${_pkgname}"
	mkdir build || true
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_RPATH="/usr/lib/${_pkgname}" ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}/build"

	make DESTDIR="${pkgdir}" install

	# Install missing CLI binary (and BASS stuff)
	install -Dm755 "bin/vgmtrans-cli" "${pkgdir}/usr/bin/vgmtrans-cli"
	install -Dm644 "../lib/bass/libbass.so" "${pkgdir}/usr/lib/${_pkgname}/libbass.so"
	install -Dm644 "../lib/bass/libbassmidi.so" "${pkgdir}/usr/lib/${_pkgname}/libbassmidi.so"

	# Add (required) ZLIB license
	install -Dm644 "../LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
