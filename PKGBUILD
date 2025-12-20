# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=wivrn-dashboard
pkgver=25.12
pkgrel=2
pkgdesc="A wireless Monado-based OpenXR runtime for standalone headsets."
arch=(x86_64)
url="https://github.com/WiVRn/WiVRn"
license=("GPL-3.0-or-later")
depends=(
	"gcc-libs"
	"glibc"
	"hicolor-icon-theme"
	"ki18n"
	"kiconthemes"
	"kirigami"
	"polkit"
	"qcoro"
	"qqc2-desktop-style"
	"qt6-base"
	"qt6-declarative"
	"vulkan-icd-loader"
)

makedepends=(
	"cmake"
	"boost"
	"extra-cmake-modules"
	"kcoreaddons"
	"librsvg"
	"glib2-devel"
	"qt6-tools"
	"nlohmann-json"
	"vulkan-headers"
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/WiVRn/WiVRn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f8490c3cd7ec28b8885539d20519f8ef6af55c1f8fc1b4b486b05639a7d8f4d5')

build() {
	cd "WiVRn-$pkgver"
	cmake -B build-dashboard . \
	-DGIT_DESC=v${pkgver} \
	-DWIVRN_BUILD_CLIENT=OFF \
	-DWIVRN_BUILD_SERVER=OFF \
	-DWIVRN_BUILD_WIVRNCTL=OFF \
	-DWIVRN_BUILD_DASHBOARD=ON \
	-DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DWIVRN_USE_VAAPI=ON \
	-DWIVRN_USE_X264=ON \
	-DWIVRN_USE_NVENC=ON \
	-DWIVRN_USE_VULKAN_ENCODE=ON \
	-DOVR_COMPAT_SEARCH_PATH=/opt/opencomposite:/opt/xrizer \
	-DWIVRN_FEATURE_STEAMVR_LIGHTHOUSE=ON \
	-Wno-dev

	cmake --build build-dashboard
}

package() {
	cd "WiVRn-$pkgver"
	DESTDIR="$pkgdir" cmake --install build-dashboard
}
