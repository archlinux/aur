# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=libretro-cemu
pkgname=$_pkgname-git
pkgver=r1228.2862644
pkgrel=1
pkgdesc="Nintendo Wii U core"
arch=('x86_64')
url="https://github.com/WizzardSK/cemu-libretro"
license=('MPL-2.0')
groups=('libretro')
depends=(
	'glibc'
	'glslang>=14'
	'libretro-core-info>=1.22.2.r18'
	'libx11'
	'pugixml'
	'sdl3>=3.4.2'
)
makedepends=(
	'boost'
	'cmake>=3.21.1'
	'curl'
	'fmt>=9'
	'git'
	'glm'
	'glu'
	'libgcc'
	'libgl'
	'libpng'
	'libstdc++'
	'libusb'
	'libzip'
	'nasm'
	'openssl'
	'rapidjson'
	'vulkan-headers>=1:1.3.225'
	'zlib'
	'zstd'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"$_pkgname-zarchive::git+https://github.com/WizzardSK/ZArchive.git"
	"imgui::git+https://github.com/ocornut/imgui.git"
)
b2sums=('SKIP'{,,})

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.dependencies/imgui.url ../imgui
	git config submodule.dependencies/ZArchive.url ../$_pkgname-zarchive
	git -c protocol.file.allow=always submodule update
	sed -i '/CMAKE_INTERPROCEDURAL_OPTIMIZATION/d' CMakeLists.txt
	sed -i '/FMT_HEADER_ONLY/d' src/Common/precompiled.h
}

build() {
	local options=(
		-B ../build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_INIT="-Wp,-U_GLIBCXX_ASSERTIONS"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D ENABLE_BLUEZ=OFF
		-D ENABLE_FERAL_GAMEMODE=OFF
		-D ENABLE_LIBRETRO=ON
		-D ENABLE_VCPKG=OFF
		-D ENABLE_WAYLAND=OFF
		-W no-dev
	)
	cd $_pkgname
	cmake "${options[@]}"
	cmake --build ../build
}

package() {
	depends+=(
		'libcrypto.so'
		'libcurl.so'
		'libEGL.so'
		'libfmt.so'
		'libgcc_s.so'
		'libGL.so'
		'libssl.so'
		'libstdc++.so'
		'libusb-1.0.so'
		'libz.so'
		'libzstd.so'
	)

	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro $_pkgname/bin/cemu_libretro.so
}
