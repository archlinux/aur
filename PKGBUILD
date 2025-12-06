# Maintainer: Luigi311 <aur@luigi311.com>
pkgname=harbour-shutter-git
pkgver=r148.84220ca
pkgrel=1
pkgdesc='A camera application designed for Sailfish which exposes all available camera parameters to the user.'
arch=('x86_64' 'aarch64')
url="https://github.com/piggz/harbour-shutter"
branch="main"
license=('GPLv2+')
depends=('qt6-multimedia' 'qt6-sensors' 'kcoreaddons' 'libexif' 'libcamera' 'kirigami' 'opencv')
makedepends=('git' 'qt6-base' 'qt6-shadertools' 'vtk' 'hdf5' 'glew' 'abseil-cpp' 'fmt' 'cmake' 'extra-cmake-modules')
checkdepends=()
optdepends=()
provides=('harbour-shutter')
conflicts=('harbour-shutter')
replaces=('harbour-shutter')
source=(
  "${pkgname}::git+${url}.git#branch=${branch}"
)
md5sums=(
  'SKIP'
)

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Make sure Qt6::GuiPrivate exists by requesting the GuiPrivate component
	# Insert "GuiPrivate" right after "ShaderTools" in the Qt6 COMPONENTS list
	sed -i '/ShaderTools/a\    GuiPrivate' CMakeLists.txt
}

build() {
	cd "${srcdir}/${pkgname}"
	local _cmake_options=(
		-B build
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX='/usr'
		-Wno-dev
	)

	cmake "${_cmake_options[@]}"
	cmake --build build
}

package() {
	cd "${srcdir}/${pkgname}"
	DESTDIR="$pkgdir" cmake --install build
}
