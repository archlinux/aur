# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-full-git
pkgver=r1187.b1ac7e0
pkgrel=2
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-only")
depends=(
	"avahi"
# 	"boost-libs"
	"ffmpeg"
	"gcc-libs"
	"glib2"
	"glibc"
	"hicolor-icon-theme"
	"ki18n"
	"kiconthemes"
	"kirigami"
	"libbsd"
	"libcap"
# 	"libdrm"
	"libglvnd"
	"libnotify"
	"libpipewire"
	"libpulse"
	"libx11"
	"libxcb"
	"openssl"
	"polkit"
	"qcoro"
	"qt6-base"
	"qt6-declarative"
	"systemd-libs"
	"vulkan-icd-loader"
# 	"wayland"
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
	"librsvg"
	"libxrandr"
	"nlohmann-json"
	"qqc2-desktop-style"
	"qt6-tools"
	"vulkan-headers"
)
optdepends=(
	"opencomposite: OpenVR to OpenXR translation layer"
)
provides=(
	"wivrn-server"
	"wivrn-dashboard"
)
conflicts=(
	"wivrn-server"
	"wivrn-dashboard"
)

source=("git+https://github.com/WiVRn/WiVRn.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/WiVRn"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "WiVRn"
	cmake -B build-dashboard . \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=ON \
	-DWIVRN_BUILD_WIVRNCTL=ON \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-DWIVRN_USE_VULKAN_ENCODE=ON \
	-DOPENCOMPOSITE_SEARCH_PATH=/opt/opencomposite \
	-Wno-dev

	cmake --build build-dashboard
}

package() {
	cd "WiVRn"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
