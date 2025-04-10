# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=0.24.1
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
	"avahi"
	"ffmpeg"
	"gcc-libs"
	"glib2"
	"glibc"
	"libbsd"
	"libgl"
	"libnotify"
	"libpipewire"
	"libpulse"
	"libx11"
	"libxcb"
	"openssl"
	"systemd-libs"
	"vulkan-icd-loader"
	"x264"
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
    "opencomposite: OpenVR to OpenXR translation layer"
    "xrizer: Another OpenVR to OpenXR translation layer"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7d9d08754b45201c7e2d8e4515672a4e1f4d045fbc8200cb317182f4c79e882e')
install=$pkgname.install

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_SERVER=ON \
	-DWIVRN_BUILD_WIVRNCTL=ON \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_DASHBOARD=OFF \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-DWIVRN_USE_VULKAN_ENCODE=ON \
	-DOVR_COMPAT_SEARCH_PATH=/opt/opencomposite:/opt/xrizer \
	-Wno-dev

	cmake --build build-server
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server
}
