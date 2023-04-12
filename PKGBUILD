# Maintainer: Charlotte Ausel <ettolrach@disroot.org>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
# Use the latest commit's date and then the number of revisions using the same command as on line 19.
pkgver=20210708.r966.156e8ae
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("ZLIB")
depends=("qt5-base" "fluidsynth" "qt5-svg" "minizip")
makedepends=("qt5-tools" "cmake" "git")
source=("${_pkgname}::git+${url}")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.r%s.%s" "$(git show -s --format="%cd" --date=short HEAD)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/-//g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	cmake -B build
	cmake --build build --target vgmtrans --parallel $(nproc)
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "build/bin/vgmtrans" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "src/ui/qt/resources/VGMTrans.desktop" "${pkgdir}/usr/share/applications/VGMTrans.desktop"
	install -Dm644 "src/ui/qt/resources/vgmtrans.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vgmtrans.png"
}
