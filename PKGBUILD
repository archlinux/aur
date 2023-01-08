# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=libretro-pcsx2
pkgname=${_pkgname}-git
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=12920
pkgrel=1
pkgdesc='Sony PlayStation 2 core'
arch=('x86_64')
url='https://github.com/libretro/pcsx2'
license=(
	'GPL2'
	'GPL3'
	'LGPL2.1'
	'LGPL3'
)
depends=(
	'gcc-libs'
	'glibc'
	'libaio'
	'glib2'
	'libglvnd'
	'zlib'
	'yaml-cpp'
	'libchdr'
)
makedepends=(
	'cmake'
	'git'
	'ninja'
	'systemd'
)
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

_srcdir="$_pkgname"

pkgver() {
	cd "$_srcdir"
	git rev-list --count HEAD
}

prepare() {
	cd "$_srcdir"
	
	# https://github.com/libretro/LRPS2/issues/180
	echo 'set_source_files_properties(FastJmp.cpp PROPERTIES COMPILE_FLAGS -fno-lto)' >> 'common/src/Utilities/CMakeLists.txt'
	
	# unbundle libchdr
	sed -i '/libchdr/d' 'cmake/SearchForStuff.cmake'
	sed -i 's/chdr-static/chdr/' 'common/src/Utilities/CMakeLists.txt'
	
	# unbundle yaml-cpp
	sed -i '/yaml-cpp/d' 'cmake/SearchForStuff.cmake'
}

build() {
	cmake -S "$_srcdir" -B 'build' -G Ninja \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DDISABLE_ADVANCE_SIMD=OFF \
		-DLIBRETRO=ON \
		-DUSE_LTO=OFF \
		-Wno-dev
	cmake --build 'build'
}

package() {
	install -Dm 644 'build/pcsx2/pcsx2_libretro.so' -t "${pkgdir}/usr/lib/libretro/"
}
