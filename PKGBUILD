# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.1243
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
	'cmake>=3.15'
	'cpp-httplib-compiled>=0.10.8'
	'cpp-jwt>=1.4'
	'cubeb>=r1486'
	'dynarmic>=6.2.4'
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
	'sirit::git+https://github.com/ReinUsesLisp/sirit.git'
	'compatibility_list.json.xz'
	'unbundle-cpp-jwt.patch'
	'unbundle-cubeb.patch'
	'unbundle-discord-rpc.patch'
	'unbundle-dynarmic.patch'
	'unbundle-enet.patch'
	'unbundle-httplib.patch'
	'unbundle-inih.patch'
	'unbundle-xbyak.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'267466b843029b133246986f75d5336b41b0faeb9f52c337a18b3ada3345530a2578d0f940d0391c4a1833ff897f19249065d6505f77a7a5e92ccdaa320f1356'
	'e8ddd00b9d2152578a4cc1b7068f34eed0f582a3ca97e27ba0644dc1c865f99675f1c228b51c378e97c881aebb14230edd147cfe9d91f5b085f4302ee2a675d6'
	'd1d0f155aa5d688b9012f35531a73e8ba906a8c809535f9dc1f149426e36f6d40727d0d2352dcc60a13425b601064ec357e0ca2d187eaf16ddf82df41ed4ce26'
	'b5a2f8031053ecb82d241312df091f705f4548ddeb06fa69f10f6a5dad71f31ab790a073cfeae7f0429bd4a2e966c1f9527ef6cd9df2679951936232556cc2e4'
	'a9f15d554b24d1f7ed297c934d712561b608b1859c7e6fe11f22d8aba092a36baef1776f8c1378a293be911dbb9828139168e73382585ce0f9d54a9fc7950d29'
	'2c04b572a4cfa07b449ac0ece8f29b0634e19174c4c7e740245fdd51c3f4fc817485d3930c5e9d2b805980577785f6b86bd66c13f5a468b3d5fb1f327e2db46c'
	'94090f1ffb260f24bec528e1ed7b53d4ab1f527f7afded252d2da6754d99301e758d72754184dcbd6331cf1389c1a5064116cb8fb05fab8e87c75f93b8a079c6'
	'fac296016f75cdd8bada7dcb835af7d8b06bfc3fc8fab87c5c30e880862e368d61c549956658e2baeba7651a78166251d015c5f7a4ac85c45161f547a4964fdb'
	'a39babe09bbfcce5eb3905e44596bac5df284e55fd9b3663e6afa4d579dfbec92a1e76e488fdbf57eac5e6a9eeb6f07e279105237f35480ff24be67d931c2756'
)

prepare() {
	cd yuzu-mainline
	cp ../compatibility_list.json dist/compatibility_list
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.sirit.url ../sirit
	git -c protocol.file.allow=always submodule update
	patch -Np1 < ../unbundle-cpp-jwt.patch
	patch -Np1 < ../unbundle-cubeb.patch
	patch -Np1 < ../unbundle-discord-rpc.patch
	patch -Np1 < ../unbundle-dynarmic.patch
	patch -Np1 < ../unbundle-enet.patch
	patch -Np1 < ../unbundle-httplib.patch
	patch -Np1 < ../unbundle-inih.patch
	patch -Np1 < ../unbundle-xbyak.patch
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
		-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_CHECK_SUBMODULES=OFF \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_TESTS="$CHECKFUNC" \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_LIBUSB=OFF \
		-DYUZU_USE_BUNDLED_OPUS=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
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
