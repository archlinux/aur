# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>
# Contributor: Brendan Szymanski <hello@bscubed.dev>
_pkgname=yuzu
pkgname=$_pkgname-git
pkgver=1620.r0.g9962a4a09
pkgrel=1
pkgdesc="Nintendo Switch emulator"
arch=('aarch64' 'x86_64')
url="https://yuzu-emu.org/"
license=('GPL3')
depends=(
	'discord-rpc>=3.4'
	'enet>=1.3.13'
	'gcc-libs'
	'glibc'
	'hicolor-icon-theme'
	'lz4>=1:1.8'
	'qt5-base>=5.15'
	'qt5-multimedia>=5.15'
	'qt5-webengine>=5.15'
	'sdl2>=2.28.4'
)
makedepends=(
	'boost>=1.79'
	'cmake>=3.22'
	'cpp-httplib>=0.14.1'
	'cpp-jwt>=1.4'
	'cubeb'
	'dynarmic>=6.4.8'
	'ffmpeg>=2:4.3.1'
	'fmt>=9'
	'git'
	'glslang'
	'libinih>=57'
	'libusb>=1.0.26'
	'libva'
	'nlohmann-json>=3.8'
	'openssl>=1.1.1'
	'opus>=1.4'
	'qt5-tools>=5.15'
	'renderdoc'
	'spirv-headers>=1:1.2.198'
	'vulkan-headers>=1:1.3.265'
	'vulkan-icd-loader'
	'vulkan-memory-allocator'
	'xbyak>=6.68'
	'zstd>=1.5'
)
checkdepends=('catch2>=3.3.1')
optdepends=('renderdoc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto')
source=(
	'yuzu-mainline::git+https://github.com/yuzu-emu/yuzu-mainline.git'
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'yuzu-sirit::git+https://github.com/yuzu-emu/sirit.git'
	'git+https://github.com/eggert/tz.git'
	'git+https://github.com/lat9nq/tzdb_to_nx.git'
	'compatibility_list.json.xz'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'0dc4730c75c24b00baf94442227dd829bca049984df0227e0a283ca9733c51c2029c604843d76a8f1114107597bef9d85107e5de4fca918fe14642a2bf20a5ca'
)

pkgver() {
	cd yuzu-mainline
	git describe --long --tags | sed 's/^mainline-0-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd yuzu-mainline
	cp ../compatibility_list.json dist/compatibility_list
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../yuzu-sirit
	git config submodule.tzdb_to_nx.url ../tzdb_to_nx
	git -c protocol.file.allow=always submodule update
	sed -i '/httplib/s/12/14/' CMakeLists.txt
	cd externals/nx_tzdb/tzdb_to_nx
	# shellcheck disable=SC2154
	git config submodule.externals/tz/tz.url "$srcdir"/tz
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -S yuzu-mainline -B build \
		-DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
		-DBUILD_TAG=mainline-${pkgver%%.*} \
		-DBUILD_TESTING="$CHECKFUNC" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISPLAY_VERSION=${pkgver%%.*} \
		-DENABLE_QT_TRANSLATION=ON \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_ENABLE_LTO=ON \
		-DYUZU_ENABLE_PORTABLE=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_VULKAN_HEADERS=OFF \
		-DYUZU_USE_FASTER_LD=OFF \
		-DYUZU_USE_PRECOMPILED_HEADERS=OFF \
		-DYUZU_USE_QT_MULTIMEDIA=ON \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	depends+=(
		'libavcodec.so'
		'libavutil.so'
		'libboost_context.so'
		'libcrypto.so'
		'libcubeb.so'
		'libdynarmic.so'
		'libfmt.so'
		'libhttplib.so'
		'libINIReader.so'
		'libopus.so'
		'libssl.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libva.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
