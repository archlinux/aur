# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=0.16
pkgrel=1
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
	"nlohmann-json")
optdepends=(
	"cuda: NVIDIA hardware encoding"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Meumeu/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c503dc9ff2c4ce7bd53c3bf7e305a3922a7393944f7fe9dd2759c4c4062f3ba5')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . -GNinja \
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
