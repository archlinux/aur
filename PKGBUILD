# Maintainer: moetayuko <loli at yuko dot moe>
# Contributor: lpt <aur AT lucapetrucci DOT net>
pkgname="qdiskinfo-git"
_pkgname="qdiskinfo"
pkgver=0.3.r110.g3416cc7
pkgrel=1
pkgdesc="CrystalDiskInfo alternative for Linux"
url="https://github.com/edisionnano/QDiskInfo"
license=("GPL-3.0-only")
source=(
	"$_pkgname::git+$url.git"
)
sha256sums=(
	"SKIP"
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
)

conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
	cd "$_pkgname"
	cmake \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_TRANSLATIONS=ON \
		-DQT_VERSION_MAJOR=6 \
		-G"Unix Makefiles" \
		-Bbuilddir \
		-S.
	cmake --build builddir
}

package () {
	cd "$_pkgname"
	DESTDIR="$pkgdir" cmake --build builddir --target install
	install -Dm0644 "dist/QDiskInfo.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/QDiskInfo.png"
}
