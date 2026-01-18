# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-full-git
pkgver=r2196.317cd6b
pkgrel=1
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")

_depends_server=(
	"gcc-libs"
	"glibc"
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
	"vulkan-icd-loader"
	"x264"
)

_depends_lib32_server=(
	"lib32-gcc-libs"
	"lib32-glibc"
	"lib32-vulkan-icd-loader"
	"lib32-libglvnd"
)

_depends_dashboard=(
	"gcc-libs"
	"glibc"
	"hicolor-icon-theme"
	"kcoreaddons"
	"ki18n"
	"kiconthemes"
	"kirigami"
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

optdepends=(
	"opencomposite: OpenVR to OpenXR translation layer"
	"xrizer: Another OpenVR to OpenXR translation layer"
	"lib32-xrizer: Another OpenVR to OpenXR translation layer (32-bits)"
)

provides=(
	"openxr-runtime"
	"lib32-openxr-runtime"
	"wivrn-server"
	"wivrn-dashboard"
	"lib32-wivrn-server"
)

conflicts=(
	"wivrn-server"
	"wivrn-dashboard"
	"lib32-wivrn-server"
	"wivrn-multilib-git"
)

source=("git+https://github.com/WiVRn/WiVRn.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/WiVRn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd WiVRn
	cmake -B build-server . \
	-G Ninja \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_SERVER=ON \
	-DWIVRN_BUILD_WIVRNCTL=ON \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
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

	cmake --build build-server
	cmake --build build-server-32
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build-server
	DESTDIR="$pkgdir" cmake --install build-server-32

	mkdir -p $pkgdir/usr/lib/environment.d
	echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 > $pkgdir/usr/lib/environment.d/wivrn.conf
}
