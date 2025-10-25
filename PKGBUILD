# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-citra
pkgname=$_pkgname-git
pkgver=r10167.5263fae
pkgrel=1
pkgdesc="Nintendo 3DS core"
arch=('x86_64')
url="https://github.com/libretro/citra"
license=('GPL-2.0-or-later')
groups=('libretro')
depends=(
	'crypto++'
	'enet'
	'gcc-libs'
	'glibc'
	'glslang'
	'libretro-core-info'
)
makedepends=(
	'catch2'
	'cmake'
	'cubeb'
	'ffmpeg4.4'
	'git'
	'libinih'
	'openssl'
	'robin-map'
	'spirv-headers'
	'vulkan-memory-allocator'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'azahar-dynarmic::git+https://github.com/azahar-emu/dynarmic.git'
	'dds-ktx::git+https://github.com/septag/dds-ktx.git'
	'faad2::git+https://github.com/knik0/faad2.git'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'lodepng::git+https://github.com/lvandeve/lodepng.git'
	'nihstro::git+https://github.com/neobrain/nihstro.git'
	'pablomk7-boost::git+https://github.com/PabloMK7/ext-boost.git'
	'pablomk7-sirit::git+https://github.com/PabloMK7/sirit.git'
	'soundtouch::git+https://codeberg.org/soundtouch/soundtouch.git'
	'teakra::git+https://github.com/wwylele/teakra.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
	'xbyak::git+https://github.com/herumi/xbyak.git'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.boost.url ../pablomk7-boost
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.dynarmic.url ../azahar-dynarmic
	git config submodule.faad2.url ../faad2
	git config submodule.fmt.url ../fmt
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../pablomk7-sirit
	git config submodule.soundtouch.url ../soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.vulkan-headers.url ../vulkan-headers
	git config submodule.xbyak.url ../xbyak
	git -c protocol.file.allow=always submodule update
	sed -i '/cmake-modules/a include(FindPkgConfig)' CMakeLists.txt
	sed -i '/check_submodules_present()/d' CMakeLists.txt
	sed -i 's/robin_map/tsl::&/' src/citra_libretro/CMakeLists.txt
	sed -i '/gamemode\.h/i #include "common/assert.h"' src/common/linux/gamemode.cpp
}

build() {
	local options=(
		-D CITRA_ENABLE_BUNDLE_TARGET=OFF
		-D CITRA_USE_PRECOMPILED_HEADERS=OFF
		-D CITRA_WARNINGS_AS_ERRORS=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4"
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5
		-D ENABLE_DEDICATED_ROOM=OFF
		-D ENABLE_LIBUSB=OFF
		-D ENABLE_OPENAL=OFF
		-D ENABLE_QT=OFF
		-D ENABLE_SCRIPTING=OFF
		-D ENABLE_SDL2=OFF
		-D ENABLE_TESTS=OFF
		-D ENABLE_WEB_SERVICE=OFF
		-D SIRIT_USE_SYSTEM_SPIRV_HEADERS=ON
		-D USE_SYSTEM_CATCH2=ON
		-D USE_SYSTEM_CRYPTOPP=ON
		-D USE_SYSTEM_CUBEB=ON
		-D USE_SYSTEM_ENET=ON
		-D USE_SYSTEM_FFMPEG_HEADERS=ON
		-D USE_SYSTEM_GLSLANG=ON
		-D USE_SYSTEM_INIH=ON
		-D USE_SYSTEM_OPENSSL=ON
		-D USE_SYSTEM_VMA=ON
		-D USE_SYSTEM_ZSTD=ON
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

package() {
	depends+=(
		'libcrypto.so'
		'libssl.so'
		'libcubeb.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/citra_libretro.so
}
