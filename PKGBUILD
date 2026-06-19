# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
# Contributor: Sapphire <imsapphire0@gmail.com>
pkgbase=wivrn-server
pkgname=(
	wivrn-server
	lib32-wivrn-server
	wivrn-dashboard
)
pkgver=26.6.1
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")

_depends_server=(
	"avahi"
	"boost-libs"
	"cairo"
	"ffmpeg"
	"glib2"
	"glibc"
	"libarchive"
	"libbsd"
	"libgcc"
	"libgl"
	"libnotify"
	"libpipewire"
	"libpng"
	"librsvg"
	"libstdc++"
	"libx11"
	"libxcb"
	"openssl"
	"systemd-libs"
	"vulkan-icd-loader"
	"x264"
)

_depends_lib32_server=(
	"lib32-gcc-libs"
	"lib32-glibc"
	"lib32-libglvnd"
	"lib32-vulkan-icd-loader"
)

_depends_dashboard=(
	"boost-libs"
	"glibc"
	"hicolor-icon-theme"
	"kcoreaddons"
	"ki18n"
	"kiconthemes"
	"kirigami"
	"kirigami-addons"
	"libgcc"
	"libstdc++"
	"polkit"
	"qcoro"
	"qqc2-desktop-style"
	"qt6-base"
	"qt6-declarative"
)

depends=(${_depends_server[@]} ${_depends_lib32_server[@]} ${_depends_dashboard[@]})

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
	"qt6-tools"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('60995109c68f84f86fa46e46af3a08d046de7177351b6664e0e7c19bb6540eb0')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-server . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DGIT_COMMIT=v${pkgver} \
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

	# 32-bit build
	PKG_CONFIG_PATH="/usr/lib32/pkgconfig" cmake -B build-server-32 -S . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DGIT_COMMIT=v${pkgver} \
	-DCMAKE_C_FLAGS="-m32" \
	-DCMAKE_CXX_FLAGS="-m32" \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_SERVER_LIBRARY=ON \
	-DWIVRN_OPENXR_MANIFEST_TYPE=relative \
	-DWIVRN_OPENXR_MANIFEST_ABI=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DCMAKE_INSTALL_LIBDIR="lib32" \
	-DVulkan_LIBRARY=/usr/lib32/libvulkan.so \
	-DVulkan_INCLUDE_DIR=/usr/include \
	-GNinja \
	-Wno-dev

	cmake -B build-dashboard . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DGIT_COMMIT=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DOVR_COMPAT_SEARCH_PATH=/opt/xrizer:/opt/opencomposite \
	-DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
	-Wno-dev

	cmake --build build-server
	cmake --build build-server-32
	cmake --build build-dashboard
}

package_wivrn-server() {
	provides=("openxr-runtime")
	depends=(${_depends_server[@]})
	optdepends=(
		"opencomposite: OpenVR to OpenXR translation layer"
		"xrizer: Another OpenVR to OpenXR translation layer"
	)

	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server

	mkdir -p $pkgdir/usr/lib/environment.d
	echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 > $pkgdir/usr/lib/environment.d/wivrn.conf
}
package_lib32-wivrn-server() {
	provides=("lib32-openxr-runtime")
	depends=(${_depends_lib32_server[@]} "wivrn-server=${pkgver}-${pkgrel}")
	optdepends=(
		"lib32-xrizer: OpenVR to OpenXR translation layer"
	)

	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-server-32
}

package_wivrn-dashboard() {
	depends=(${_depends_dashboard[@]} "wivrn-server=${pkgver}-${pkgrel}")
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
