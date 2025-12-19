# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-full-git
pkgver=r2134.2095ab6
pkgrel=1
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
	"hicolor-icon-theme"
	"ki18n"
	"kiconthemes"
	"kirigami"
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
	"polkit"
	"qcoro"
	"qqc2-desktop-style"
	"qt6-base"
	"qt6-declarative"
	"systemd-libs"
	"vulkan-icd-loader"
	"x264"
)
makedepends=(
	"boost"
	"cli11"
	"cmake"
	"eigen"
	"extra-cmake-modules"
	"git"
	"glib2-devel"
	"kcoreaddons"
	"libdrm"
	"librsvg"
	"libxrandr"
	"nlohmann-json"
	"qt6-tools"
	"vulkan-headers"
)
optdepends=(
    "opencomposite: OpenVR to OpenXR translation layer"
    "xrizer: Another OpenVR to OpenXR translation layer"
)
provides=(
	"wivrn-server"
	"wivrn-dashboard"
	"openxr-runtime"
)
conflicts=(
	"wivrn-server"
	"wivrn-dashboard"
)

source=("git+https://github.com/WiVRn/WiVRn.git")
sha256sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd "${srcdir}/WiVRn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "WiVRn"
	cmake -B build . \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=ON \
	-DWIVRN_BUILD_WIVRNCTL=ON \
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

	cmake --build build
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build

	mkdir -p $pkgdir/usr/lib/environment.d
	echo PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES=1 > $pkgdir/usr/lib/environment.d/wivrn.conf
}
