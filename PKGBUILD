# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=0.20
pkgrel=4
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
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
	"boost-libs"
)
makedepends=(
	"cmake"
	"eigen"
	"nlohmann-json"
	"cli11"
	"glib2-devel"
	"boost"
)
optdepends=(
	"cuda: NVIDIA hardware encoding"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f7022323384b1b2977a1363f4961ccce6d0afc46addc958d4cafd18f5c4f6cb0')
install=$pkgname.install

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . \
	-DGIT_DESC=v${pkgver} \
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
