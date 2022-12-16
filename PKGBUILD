# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.1271
pkgrel=1
pkgdesc="Nintendo Switch emulator"
arch=('aarch64' 'x86_64')
url="https://yuzu-emu.org/"
license=('GPL3')
depends=(
	'discord-rpc>=3.4'
	'enet>=1.3.13'
	'qt5-multimedia>=5.15'
	'qt5-webengine>=5.15'
)
makedepends=(
	'boost>=1.73'
	'cmake>=3.22'
	'cpp-httplib-compiled>=0.10.8'
	'cpp-jwt>=1.4'
	'cubeb>=r1486'
	'dynarmic>=6.4'
	'ffmpeg>=4.3.1'
	'fmt>=9'
	'git'
	'glslang'
	'libinih>=52'
	'libusb>=1.0.24'
	'libva'
	'lz4>=1.8'
	'nlohmann-json>=3.8'
	'openssl'
	'opus>=1.3'
	'qt5-tools>=5.15'
	'sdl2>=2.0.18'
	'spirv-headers>=1.2.198'
	'vulkan-headers>=1.3.213'
	'xbyak>=6.64'
	'zstd>=1.5'
)
checkdepends=(
	'catch2>=2.13.9'
	'catch2<3'
)
source=(
	"yuzu-mainline::git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${pkgver//./-}"
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'yuzu-sirit::git+https://github.com/yuzu-emu/sirit.git'
	'compatibility_list.json.xz'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'1d9591b3aad22b6a543c1675c5c12eb92ae4af33198c39cc4932a2916cf767c6da28381082e336e80d4d54bc453528c8d915b4c58fd6209338ee304b67fae112'
)

prepare() {
	cd yuzu-mainline
	cp ../compatibility_list.json dist/compatibility_list
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../yuzu-sirit
	git -c protocol.file.allow=always submodule update
}

build() {
	cmake -S yuzu-mainline -B build \
		-DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
		-DBUILD_TAG=${pkgver/.0./-} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISPLAY_VERSION=${pkgver##*.} \
		-DENABLE_QT_TRANSLATION=ON \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_TESTS="$CHECKFUNC" \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
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
		'libswscale.so'
		'libusb-1.0.so'
		'libva.so'
		'libzstd.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
