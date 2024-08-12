# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=0.17
pkgrel=2
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/Meumeu/WiVRn"
license=("GPL-3.0-only")
depends=(
	"avahi"
	"ffmpeg"
	"gcc-libs"
	"glibc"
	"libbsd"
	"libgl"
	"libpipewire"
	"libpulse"
	"libx11"
	"libxcb"
	"systemd-libs"
	"vulkan-icd-loader"
	"x264"
)
makedepends=(
	"cmake"
	"eigen"
	"nlohmann-json"
	"cli11")
optdepends=(
	"cuda: NVIDIA hardware encoding"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Meumeu/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc6f3dac944b48d26641954dded91e3af23d8508799c62ae4d1094357aaf70e0')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . -GNinja \
	-DGIT_DESC=${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-Wno-dev

	cmake --build build-server
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server
}
