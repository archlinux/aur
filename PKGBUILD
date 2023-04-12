# Maintainer: Charlotte Ausel <ettolrach@disroot.org>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
pkgver=1.1.r22.gaeea082
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("ZLIB")
depends=("hicolor-icon-theme" "minizip" "qt6-base" "qt6-svg")
makedepends=("cmake" "git" "qt6-tools")
source=("${_pkgname}::git+${url}"
	fix-header-import.patch)
sha256sums=("SKIP"
            "85caf04f1644abc66e87e5f67cb67281a50ee50ace2213efbcf2a80e3fa5ad9d")

prepare() {
	cd "${srcdir}/${_pkgname}"
	mkdir build || true

	# Add patch to fix compile errors (TODO: upstream this)
	patch -Np1 -i ../fix-header-import.patch
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
