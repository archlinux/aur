# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=0.20
pkgrel=3
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
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7022323384b1b2977a1363f4961ccce6d0afc46addc958d4cafd18f5c4f6cb0')

prepare() {
    patch -d "WiVRn-$pkgver" -Np1 < ../0001-Fix-translations-with-Qt-6.8.patch
}

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-dashboard . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-Wno-dev

	cmake --build build-dashboard
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
