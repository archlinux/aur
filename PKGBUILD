# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=0.14.1
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
	"nlohmann-json")
optdepends=(
	"cuda: NVIDIA hardware encoding"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Meumeu/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fab236e3e6506bd87ef0ecdb8999a5bca932dbaffe1cc87f2b1ca35615e77395')

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
