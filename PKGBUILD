# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
_pkgname=libretro-citra
pkgname=$_pkgname-git
pkgver=r10157.973795ccb
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
	'boost'
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
	'xbyak'
	'zstd'
)
provides=("$_pkgname=${pkgver#r}")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	'dds-ktx::git+https://github.com/septag/dds-ktx.git'
	'faad2::git+https://github.com/knik0/faad2.git'
	'fmt::git+https://github.com/fmtlib/fmt.git'
	'lodepng::git+https://github.com/lvandeve/lodepng.git'
	'nihstro::git+https://github.com/neobrain/nihstro.git'
	'pablomk7-dynarmic::git+https://github.com/PabloMK7/dynarmic.git'
	'pablomk7-sirit::git+https://github.com/PabloMK7/sirit.git'
	'soundtouch::git+https://codeberg.org/soundtouch/soundtouch.git'
	'teakra::git+https://github.com/wwylele/teakra.git'
	'vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git'
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
)

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.dynarmic.url ../pablomk7-dynarmic
	git config submodule.faad2.url ../faad2
	git config submodule.fmt.url ../fmt
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../pablomk7-sirit
	git config submodule.soundtouch.url ../soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.vulkan-headers.url ../vulkan-headers
	git -c protocol.file.allow=always submodule update
	sed -i '/cmake-modules/a include(FindPkgConfig)' CMakeLists.txt
	sed -i '/check_submodules_present()/d' CMakeLists.txt
	sed -i '/BOOST_ASIO_DISABLE_CONCEPTS/d' CMakeLists.txt
	sed -i 's/boost/Boost::&/' src/citra_libretro/CMakeLists.txt
	sed -i 's/robin_map/tsl::&/' src/citra_libretro/CMakeLists.txt
	sed -i '/gamemode\.h/i #include "common/assert.h"' src/common/linux/gamemode.cpp
}

build() {
	cmake -B build -S $_pkgname \
		-DCITRA_ENABLE_BUNDLE_TARGET=OFF \
		-DCITRA_USE_PRECOMPILED_HEADERS=OFF \
		-DCITRA_WARNINGS_AS_ERRORS=OFF \
		-DCMAKE_BUILD_TYPE="Release" \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4" \
		-DENABLE_DEDICATED_ROOM=OFF \
		-DENABLE_LIBUSB=OFF \
		-DENABLE_OPENAL=OFF \
		-DENABLE_QT=OFF \
		-DENABLE_SCRIPTING=OFF \
		-DENABLE_SDL2=OFF \
		-DENABLE_TESTS=OFF \
		-DENABLE_WEB_SERVICE=OFF \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-DUSE_SYSTEM_BOOST=ON \
		-DUSE_SYSTEM_CATCH2=ON \
		-DUSE_SYSTEM_CRYPTOPP=ON \
		-DUSE_SYSTEM_CUBEB=ON \
		-DUSE_SYSTEM_ENET=ON \
		-DUSE_SYSTEM_FFMPEG_HEADERS=ON \
		-DUSE_SYSTEM_GLSLANG=ON \
		-DUSE_SYSTEM_INIH=ON \
		-DUSE_SYSTEM_OPENSSL=ON \
		-DUSE_SYSTEM_VMA=ON \
		-DUSE_SYSTEM_XBYAK=ON \
		-DUSE_SYSTEM_ZSTD=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=(
		libcrypto.so
		libssl.so
		libcubeb.so
		libboost_serialization.so
		libboost_iostreams.so
		libzstd.so
	)
	# shellcheck disable=SC2154
	install -D -t "$pkgdir"/usr/lib/libretro build/citra_libretro.so
}
