# Maintainer: Sapphire <imsapphire0 at gmail dot com>
pkgname=wivrn-dashboard-git
pkgver=0.22.r85.gb97c8b2
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-only")
depends=(
	"gcc-libs"
	"glibc"
	"hicolor-icon-theme"
	"qt6-base"
	"wivrn-server"
	"polkit"
	"libcap"
	"boost-libs"
)
makedepends=(
	"cmake"
	"boost"
	"librsvg"
	"glib2-devel"
	"qt6-tools"
	"nlohmann-json"
	"git"
)
conflicts=("wivrn-dashboard")
provides=("wivrn-dashboard")
source=("git+https://github.com/WiVRn/WiVRn")
sha256sums=('SKIP')

pkgver() {
	cd "WiVRn"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "WiVRn"
	cmake -B build-dashboard . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-Wno-dev

	cmake --build build-dashboard
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
