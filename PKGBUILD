# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgbase=azahar
pkgname=({,libretro-}"$_pkgbase-git")
pkgver=2125.0.rc1.r11.gab39df3
pkgrel=1
arch=('x86_64')
url="https://azahar-emu.org/"
license=('GPL-2.0-or-later')
depends=(
	'crypto++'
	'enet'
	'glibc'
	'glslang'
)
makedepends=(
	'boost'
	'cmake'
	'cpp-jwt'
	'cubeb'
	'ffmpeg4.4'
	'fmt'
	'git'
	'libbacktrace'
	'libgcc'
	'libinih'
	'libstdc++'
	'libusb'
	'nlohmann-json'
	'openal'
	'openssl'
	'qt6-base'
	'qt6-multimedia'
	'qt6-tools'
	'rapidjson'
	'robin-map'
	'sdl2'
	'spirv-headers'
	'vulkan-headers'
	'vulkan-memory-allocator'
	'zydis'
)
checkdepends=('catch2')
source=(
	"$_pkgbase::git+https://github.com/azahar-emu/azahar.git"
	"$_pkgbase-compatibility-list::git+https://github.com/azahar-emu/compatibility-list.git"
	"$_pkgbase-discord-rpc::git+https://github.com/azahar-emu/discord-rpc.git"
	"$_pkgbase-dynarmic::git+https://github.com/azahar-emu/dynarmic.git"
	"$_pkgbase-mcl::git+https://github.com/azahar-emu/mcl.git"
	"$_pkgbase-sirit::git+https://github.com/azahar-emu/sirit.git"
	"$_pkgbase-soundtouch::git+https://github.com/azahar-emu/soundtouch.git"
	"dds-ktx::git+https://github.com/septag/dds-ktx.git"
	"faad2::git+https://github.com/knik0/faad2.git"
	"libretro-common::git+https://github.com/libretro/libretro-common.git"
	"lodepng::git+https://github.com/lvandeve/lodepng.git"
	"nihstro::git+https://github.com/neobrain/nihstro.git"
	"teakra::git+https://github.com/wwylele/teakra.git"
	"xbyak::git+https://github.com/herumi/xbyak.git"
	"xxhash::git+https://github.com/Cyan4973/xxHash.git"
	"zstd::git+https://github.com/facebook/zstd.git"
)
b2sums=('SKIP'{,,,,,,,,,,,,,,,})

pkgver() {
	cd $_pkgbase
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgbase
	git config submodule.compatibility-list.url ../$_pkgbase-compatibility-list
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.discord-rpc.url ../$_pkgbase-discord-rpc
	git config submodule.dynarmic.url ../$_pkgbase-dynarmic
	git config submodule.externals/libretro-common.url ../libretro-common
	git config submodule.externals/xxHash.url ../xxhash
	git config submodule.faad2.url ../faad2
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../$_pkgbase-sirit
	git config submodule.soundtouch.url ../$_pkgbase-soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.xbyak.url ../xbyak
	git config submodule.zstd.url ../zstd
	git -c protocol.file.allow=always submodule update
	cd externals/dynarmic
	git config submodule.mcl.url ../../../$_pkgbase-mcl
	git -c protocol.file.allow=always submodule update
	# ignore unneeded missing submodules
	sed -i '/check_submodules_present()/d' ../../CMakeLists.txt
	# use system spirv-tools
	sed -i '/spirv-tools/d' ../../externals/CMakeLists.txt
}

build() {
	local options=(
		-D CITRA_USE_PRECOMPILED_HEADERS=OFF
		-D CITRA_WARNINGS_AS_ERRORS=OFF
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_C_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D DISABLE_SYSTEM_CPP_HTTPLIB=ON
		-D DISABLE_SYSTEM_DYNARMIC=ON
		-D DISABLE_SYSTEM_LODEPNG=ON
		-D DISABLE_SYSTEM_SOUNDTOUCH=ON
		-D DISABLE_SYSTEM_XBYAK=ON
		-D DISABLE_SYSTEM_ZSTD=ON
		-D ENABLE_LTO=OFF
		-D ENABLE_QT_TRANSLATION=ON
		-D ENABLE_ROOM_STANDALONE=OFF
		-D ENABLE_TESTS="$CHECKFUNC"
		-D USE_DISCORD_PRESENCE=ON
		-D USE_SYSTEM_LIBS=ON
		-Wno-dev
	)
	local flags
	IFS=' ' read -r -a flags <<< "$CXXFLAGS"
	if ! g++ "${flags[@]}" -dM -E - < /dev/null | grep -q __SSE4_2__; then
		options+=(-D ENABLE_SSE42=OFF)
	fi
	cd $_pkgbase
	cmake "${options[@]}" -B build
	cmake --build build
	options+=(
		-D ENABLE_LIBRETRO=ON
		-D ENABLE_QT_TRANSLATION=OFF
		-D ENABLE_TESTS=OFF
	)
	cmake "${options[@]}" -B build-libretro
	cmake --build build-libretro
}

check() {
	cd $_pkgbase
	ctest --output-on-failure --test-dir build
}

package_azahar-git() {
	pkgdesc="Nintendo 3DS emulator based on Citra"
	depends+=(
		'hicolor-icon-theme'
		'libbacktrace.so'
		'libboost_iostreams.so'
		'libboost_serialization.so'
		'libcrypto.so'
		'libcubeb.so'
		'libfmt.so'
		'libgcc_s.so'
		'libopenal.so'
		'libssl.so'
		'libstdc++.so'
		'libusb-1.0.so'
		'libZydis.so'
		'qt6-base'
		'qt6-multimedia'
		'sdl2'
	)
	provides=("$_pkgbase=$pkgver")
	conflicts=("$_pkgbase")

	cd $_pkgbase
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}

package_libretro-azahar-git() {
	pkgdesc="Nintendo 3DS core based on Citra"
	groups=('libretro')
	depends+=(
		'libbacktrace.so'
		'libboost_iostreams.so'
		'libboost_serialization.so'
		'libcrypto.so'
		'libfmt.so'
		'libgcc_s.so'
		'libretro-core-info>=1.22'
		'libssl.so'
		'libstdc++.so'
		'libZydis.so'
	)
	provides=("libretro-$_pkgbase=$pkgver")
	conflicts=("libretro-$_pkgbase")

	cd $_pkgbase
	install -D -t "$pkgdir"/usr/lib/libretro build-libretro/bin/Release/azahar_libretro.so
}
