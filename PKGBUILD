# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname="qdiskinfo"
_pkgname="QDiskInfo"
pkgver="0.2"
pkgrel="1"
pkgdesc="CrystalDiskInfo alternative for Linux"
url="https://github.com/edisionnano/QDiskInfo"
license=("GPL-3.0-only")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
	"qdiskinfo.desktop"
)
sha256sums=(
	"e4c0d352c75ca0dd8f152b09e17c7542aebd1d320e5fee8e9bd8c35cb1d3cbb2"
	"4754bf3c5c718723ed47a06772134a393a8b8996eeb3ee75c2711811d140ff8a"
)
arch=("x86_64")
depends=(
	"qt6-base"
	"qt6-svg"
	"smartmontools"
	"polkit"
	"hicolor-icon-theme"
)
makedepends=(
	"cmake"
	"imagemagick"
)

prepare () {
	cd "$_pkgname-$pkgver"
	convert -background none -size 48x48 src/icon.svg "$srcdir/qdiskinfo-48x48.png"
}

build () {
	cd "$_pkgname-$pkgver"
	cmake \
		-DCMAKE_BUILD_TYPE=MinSizeRel \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_VERSION_MAJOR=6 \
		-G"Unix Makefiles" \
		-Bbuilddir \
		-S.
	cmake --build builddir
}

package () {
	cd "$_pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --build builddir --target install
	install -Dm0644 src/icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qdiskinfo.svg"
	install -Dm0644 "$srcdir/qdiskinfo-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/qdiskinfo.png"
	install -Dm0644 "$srcdir/qdiskinfo.desktop" "$pkgdir/usr/share/applications/qdiskinfo.desktop"
}
