# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cemu
pkgname=$_pkgname-git
pkgver=2.0.r47.gd94ecfe
pkgrel=1
pkgdesc="Nintendo Wii U emulator"
arch=('x86_64')
url="https://cemu.info/"
license=('MPL2')
depends=(
	'discord-rpc'
	'imgui'
	'pugixml'
	'wxgtk3'
)
makedepends=(
	'boost'
	'cmake'
	'cubeb'
	'curl'
	'git'
	'glm'
	'glslang'
	'glu'
	'libpng'
	'libzip'
	'nasm'
	'openssl'
	'rapidjson'
	'sdl2'
	'vulkan-headers'
	'zarchive'
	'zlib'
	'zstd'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/cemu-project/Cemu.git"
	"$_pkgname.bash"
	'fmt-7.1.3.tar.gz::https://github.com/fmtlib/fmt/archive/refs/tags/7.1.3.tar.gz'
)
b2sums=(
	'SKIP'
	'311709dac55b6864d0db343b59fe82d99ee810896e1dcdb39bdfb76ce7d995fa4d710c0d479e0ce0129c3556482ae17d85664ef4ea875e1de86bc65e92e70a16'
	'745440a6f5876d47d4651d007d5968f77d8f5ac01ab5ec17ec5851130a5581e2aa7d359ae297ce7318023b0bf386f9c027e3e38c65f297ae874e607253a3493a'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgname
	ln -sr ../fmt-7.1.3 dependencies/fmt
	sed -i '/fmt/c add_subdirectory(dependencies/fmt)' CMakeLists.txt
	sed -i '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt
	sed -i '/discord-rpc/d' CMakeLists.txt
	sed -i 's/glm::glm/glm/' src/{Common,input}/CMakeLists.txt
	sed -i 's/GLSLANG_VERSION_LESS_OR_EQUAL_TO/GLSLANG_VERSION_GREATER_OR_EQUAL_TO/' src/Cafe/HW/Latte/Renderer/Vulkan/RendererShaderVk.cpp
}

build() {
	cmake -S $_pkgname -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_FLAGS_INIT="-I$srcdir/$_pkgname/dependencies/fmt/include" \
		-DCMAKE_RUNTIME_OUTPUT_DIRECTORY=bin \
		-DENABLE_VCPKG=OFF \
		-DPUBLIC_RELEASE=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		'libboost_filesystem.so'
		'libboost_program_options.so'
		'libcubeb.so'
		'libcurl.so'
		'libzarchive.so'
		'libzip.so'
		'libzstd.so'
	)
	cd $_pkgname
	# shellcheck disable=SC2154
	install -D ../$_pkgname.bash "$pkgdir"/usr/bin/$_pkgname
	install -D -t "$pkgdir"/usr/lib/$_pkgname ../build/src/bin/Cemu
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr/lib/$_pkgname bin/*
	install -Dm644 -t "$pkgdir"/usr/share/applications dist/linux/info.cemu.Cemu.desktop
	install -Dm644 -t "$pkgdir"/usr/share/metainfo dist/linux/info.cemu.Cemu.metainfo.xml
}
