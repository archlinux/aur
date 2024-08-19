# Maintainer: lpt <aur AT lucapetrucci DOT net>
pkgname="qdiskinfo"
_pkgname="QDiskInfo"
pkgver="0.3"
pkgrel="1"
pkgdesc="CrystalDiskInfo alternative for Linux"
url="https://github.com/edisionnano/QDiskInfo"
license=("GPL-3.0-only")
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
)
sha256sums=(
	"f9829a488ff08395e14f953d41a85dac9c91714fdd34bc9a76a46fe761511209"
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
	convert -background none -size 48x48 dist/QDiskInfo.svg "$srcdir/QDiskInfo-48x48.png"
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
	install -Dm0644 "$srcdir/QDiskInfo-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/QDiskInfo.png"
}
