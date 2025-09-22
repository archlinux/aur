# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-server
pkgver=25.9
pkgrel=2
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
	"avahi"
	"cairo"
	"ffmpeg"
	"gcc-libs"
	"glib2"
	"glibc"
	"libarchive"
	"libbsd"
	"libgl"
	"libnotify"
	"libpipewire"
	"libpng"
	"libpulse"
	"librsvg"
	"libx11"
	"libxcb"
	"openssl"
	"systemd-libs"
	"vulkan-icd-loader"
	"x264"
)

makedepends=(
	"boost"
	"cli11"
	"cmake"
	"eigen"
	"git"
	"glib2-devel"
	"libdrm"
	"libxrandr"
	"nlohmann-json"
	"vulkan-headers"
	"wayland"
)

optdepends=(
    "opencomposite: OpenVR to OpenXR translation layer"
    "xrizer: Another OpenVR to OpenXR translation layer"
)
provides=("openxr-runtime")
source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz"
        "c0c10fd34df85706e5897fd79eea3fb40461f1c0.patch")
sha256sums=('13eb42b84464de90e43676cef017fd53303e84fac5a7a69ceafdea7cd5ebc7f8'
            '643400ade23ff221439d3f1a27583dae832384ea36ccd787283033aa7bf17aad')
install=$pkgname.install

prepare() {
	cp c0c10fd34df85706e5897fd79eea3fb40461f1c0.patch "WiVRn-$pkgver/patches/monado"
}

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
	-DOVR_COMPAT_SEARCH_PATH=/opt/xrizer:/opt/opencomposite \
	-DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
	-Wno-dev

	cmake --build build-server
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server

	mkdir -p $pkgdir/usr/lib/environment.d
	echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 > $pkgdir/usr/lib/environment.d/wivrn.conf
}
