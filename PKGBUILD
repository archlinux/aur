# Maintainer: Sapphire <imsapphire0 at gmail dot com>
pkgname=wivrn-server-git
_pkgname=wivrn-server
pkgver=0.22.r85.gb97c8b2
pkgrel=1
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
	"libnotify"
	"glib2"
	"openssl"
)
makedepends=(
	"cmake"
	"boost-libs"
	"eigen"
	"nlohmann-json"
	"cli11"
	"glib2-devel"
	"boost"
	"vulkan-headers"
	"libxrandr"
	"git"
)
optdepends=(
	"cuda: NVIDIA hardware encoding"
)
conflicts=("wivrn-server")
provides=("wivrn-server" "openxr-runtime")
source=("git+https://github.com/WiVRn/WiVRn")
sha256sums=('SKIP')
install=$_pkgname.install

pkgver() {
	cd "WiVRn"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "WiVRn"
	cmake -B build-server . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-DOPENCOMPOSITE_SEARCH_PATH=/opt/opencomposite \
	-Wno-dev

	cmake --build build-server
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build-server
}
