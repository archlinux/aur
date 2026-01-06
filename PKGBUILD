# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
# Contributor: Sapphire <imsapphire0@gmail.com>
pkgbase=wivrn-server
pkgname=(
	wivrn-server
	wivrn-dashboard
)
pkgver=25.12
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
	# Shared
	"gcc-libs"
	"glibc"
	"vulkan-icd-loader"

	# Server
	"avahi"
	"cairo"
	"ffmpeg"
	"glib2"
	"libarchive"
	"libbsd"
	"libgl"
	"libnotify"
	"libpipewire"
	"libpng"
	"librsvg"
	"libx11"
	"libxcb"
	"openssl"
	"systemd-libs"
	"x264"

	# Dashboard
	"hicolor-icon-theme"
	"ki18n"
	"kiconthemes"
	"kirigami"
	"polkit"
	"qcoro"
	"qqc2-desktop-style"
	"qt6-base"
	"qt6-declarative"
)

makedepends=(
	# Shared
	"boost"
	"cmake"
	"git"
	"glib2-devel"
	"ninja"
	"nlohmann-json"
	"vulkan-headers"

	# Server
	"cli11"
	"eigen"
	"libdrm"
	"libxrandr"

	# Dashboard
	"extra-cmake-modules"
	"kcoreaddons"
	"qt6-tools"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8490c3cd7ec28b8885539d20519f8ef6af55c1f8fc1b4b486b05639a7d8f4d5')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_SERVER=ON \
	-DWIVRN_BUILD_WIVRNCTL=ON \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_DASHBOARD=OFF \
	-DWIVRN_OPENXR_MANIFEST_TYPE=relative \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-DWIVRN_USE_VULKAN_ENCODE=ON \
	-DOVR_COMPAT_SEARCH_PATH=/opt/xrizer:/opt/opencomposite \
	-DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
	-Wno-dev

	cmake -B build-dashboard . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DOVR_COMPAT_SEARCH_PATH=/opt/opencomposite:/opt/xrizer \
	-DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
	-Wno-dev

	cmake --build build-server
	cmake --build build-dashboard
}

package_wivrn-server() {
	provides=("openxr-runtime")
	optdepends=(
		"opencomposite: OpenVR to OpenXR translation layer"
		"xrizer: Another OpenVR to OpenXR translation layer"
	)
	install=$pkgname.install

	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server

	mkdir -p $pkgdir/usr/lib/environment.d
	echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 > $pkgdir/usr/lib/environment.d/wivrn.conf
}
package_wivrn-dashboard() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
