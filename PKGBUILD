# Maintainer: Camren Mumme <camren.mumme@gmail.com>
pkgname=wivrn-server
pkgver=0.10.2
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/Meumeu/WiVRn"
license=("GPL-3-only")
depends=(
	"x264"
	"eigen"
	"libpulse"
	"avahi"
	"nlohmann-json"
)
makedepends=("cmake")
optdepends=(
	"ffmpeg: AMD/Intel hardware encoding",
	"cuda: NVIDIA hardware encoding"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver::git+https://github.com/Meumeu/WiVRn.git#tag=v$pkgver")
sha256sums=("SKIP")

_use_nvenc=OFF

prepare() {
	# Use NVENC if cuda is installed. Build errors if compiled with 
	# DWIVRN_USE_NVENC on non-nvidia system. (or it's just broken,
	# I don't have a nvidia system to test on)
	# TODO: Find a better way to do this?
	_use_nvenc=[[ $(pacman -Q cuda) = "" ]] && echo "OFF" || echo "ON"
	echo "Build with NVENC: $_use_nvenc"
}

build() {
	cd "$pkgname-$pkgver"
	cmake -B build-server . -GNinja \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=$_use_nvenc \
	-Wno-dev

	cmake --build build-server
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server
}
