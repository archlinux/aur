# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=azahar
pkgname=$_pkgname-git
pkgver=2123.rc2.r57.g9996a07
pkgrel=1
pkgdesc="Nintendo 3DS emulator based on Citra"
arch=('x86_64')
url="https://azahar-emu.org/"
license=('GPL-2.0-or-later')
depends=(
	'crypto++'
	'enet'
	'gcc-libs'
	'glibc'
	'glslang'
	'hicolor-icon-theme'
	'qt6-base'
	'qt6-multimedia'
	'sdl2'
)
makedepends=(
	'boost'
	'catch2'
	'cmake'
	'cpp-jwt'
	'cubeb'
	'ffmpeg4.4'
	'fmt'
	'git'
	'libbacktrace'
	'libinih'
	'libusb'
	'nlohmann-json'
	'openal'
	'openssl'
	'qt6-tools'
	'rapidjson'
	'robin-map'
	'spirv-headers'
	'vulkan-headers'
	'vulkan-memory-allocator'
	'zydis'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/azahar-emu/azahar.git"
	"$_pkgname-compatibility-list::git+https://github.com/azahar-emu/compatibility-list.git"
	"$_pkgname-discord-rpc::git+https://github.com/azahar-emu/discord-rpc.git"
	"$_pkgname-dynarmic::git+https://github.com/azahar-emu/dynarmic.git"
	"$_pkgname-mcl::git+https://github.com/azahar-emu/mcl.git"
	"$_pkgname-sirit::git+https://github.com/azahar-emu/sirit.git"
	"$_pkgname-soundtouch::git+https://github.com/azahar-emu/soundtouch.git"
	"dds-ktx::git+https://github.com/septag/dds-ktx.git"
	"faad2::git+https://github.com/knik0/faad2.git"
	"lodepng::git+https://github.com/lvandeve/lodepng.git"
	"nihstro::git+https://github.com/neobrain/nihstro.git"
	"teakra::git+https://github.com/wwylele/teakra.git"
	"xbyak::git+https://github.com/herumi/xbyak.git"
	"zstd::git+https://github.com/facebook/zstd.git"
)
b2sums=('SKIP'{,,,,,,,,,,,,,})

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	git config submodule.compatibility-list.url ../$_pkgname-compatibility-list
	git config submodule.dds-ktx.url ../dds-ktx
	git config submodule.discord-rpc.url ../$_pkgname-discord-rpc
	git config submodule.dynarmic.url ../$_pkgname-dynarmic
	git config submodule.faad2.url ../faad2
	git config submodule.lodepng.url ../lodepng
	git config submodule.nihstro.url ../nihstro
	git config submodule.sirit.url ../$_pkgname-sirit
	git config submodule.soundtouch.url ../$_pkgname-soundtouch
	git config submodule.teakra.url ../teakra
	git config submodule.xbyak.url ../xbyak
	git config submodule.zstd.url ../zstd
	git -c protocol.file.allow=always submodule update
	cd externals/dynarmic
	git config submodule.mcl.url ../../../$_pkgname-mcl
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
	cd $_pkgname
	cmake "${options[@]}" -B build
	cmake --build build
}

check() {
	cd $_pkgname
	ctest --output-on-failure --test-dir build
}

package() {
	depends+=(
		'libbacktrace.so'
		'libboost_iostreams.so'
		'libboost_serialization.so'
		'libcrypto.so'
		'libcubeb.so'
		'libfmt.so'
		'libopenal.so'
		'libssl.so'
		'libusb-1.0.so'
		'libZydis.so'
	)
	cd $_pkgname
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
