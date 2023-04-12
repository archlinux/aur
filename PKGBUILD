# Maintainer: Charlotte Ausel <ettolrach@disroot.org>

_pkgname=vgmtrans
pkgname=${_pkgname}-git
# Use the latest commit's date and then the number of revisions using the same command as on line 19.
pkgver=20230326.r1142.aeea082
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=("ZLIB")
depends=("qt6-base" "fluidsynth" "qt6-svg" "minizip")
makedepends=("qt6-tools" "cmake" "git")
optdepends=("qt6-wayland: Wayland support")
source=("${_pkgname}::git+${url}"
	fix-header-import.patch)
sha256sums=("SKIP"
            "85caf04f1644abc66e87e5f67cb67281a50ee50ace2213efbcf2a80e3fa5ad9d")

prepare() {
	cd "${srcdir}/${_pkgname}"

	patch -Np1 -i ../fix-header-import.patch
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.r%s.%s" "$(git show -s --format="%cd" --date=short HEAD)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" | sed 's/-//g'
}

build() {
	cd "${srcdir}/${_pkgname}/build"

	cmake ..
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 "build/bin/vgmtrans" "$pkgdir/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "src/ui/qt/resources/VGMTrans.desktop" "${pkgdir}/usr/share/applications/VGMTrans.desktop"
	install -Dm644 "src/ui/qt/resources/vgmtrans.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/vgmtrans.png"
}
