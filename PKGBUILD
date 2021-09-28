# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=yuzu
pkgver=mainline.0.763
pkgrel=1
pkgdesc="Nintendo Switch emulator"
arch=('x86_64')
url="https://yuzu-emu.org/"
license=('GPL2')
depends=('qt5-webengine>=5.12')
makedepends=(
	'boost>=1.73'
	'cmake>=3.15'
	'cpp-httplib-compiled>=0.9.1'
	'cubeb>=r1398'
	'discord-rpc>=3.4.0.r10'
	'dynarmic>=5.r113'
	'ffmpeg>=4.3.1'
	'fmt>=8'
	'git'
	'glslang'
	'libinih>=52'
	'libusb>=1.0.24'
	'libzip>=1.5'
	'lz4>=1.8'
	'ninja'
	'nlohmann-json>=3.8'
	'opus>=1.3'
	'qt5-tools>=5.12'
	'sdl2>=2.0.16'
	'sirit>=r185'
	'vulkan-headers>=1.2.145'
	'xbyak>=5.995.r3'
	'zstd>=1.5'
)
checkdepends=('catch2>=2.13')
source=(
	"git+https://github.com/yuzu-emu/yuzu-mainline.git#tag=${pkgver//./-}"
	"gamedb-$(date -I).json::https://api.yuzu-emu.org/gamedb/"
	'yuzu-mbedtls::git+https://github.com/yuzu-emu/mbedtls.git'
	'citra-soundtouch::git+https://github.com/citra-emu/ext-soundtouch.git'
	'unbundle-catch2.patch'
	'unbundle-cubeb.patch'
	'unbundle-discord-rpc.patch'
	'unbundle-dynarmic.patch'
	'unbundle-httplib.patch'
	'unbundle-inih.patch'
	'unbundle-sirit.patch'
	'unbundle-xbyak.patch'
)
b2sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
	'7e7b050263b6ecf353aee02127bfe882d7af3102f5bfd24f6068b775a5703753c247aaf68d00defafcfeaffdd3d48f9393f9b3d628279db3fc78788f134725da'
	'5f1cf15e9486e50fe9416919bf34d9b78e5f02cab96216cef77f365855e4c09eaa74118de89c29f6b7899fa43f07e0f70ef8fb21e47808ef347212ea9ee4ed39'
	'0c9b84444e4c938a04b1f60907fc816cbe8eb8d598a9a4b7e490750d339fac7a48de1b682bc5b00b6c2333b5f4e39b1738287b9168844094e3817703635aad9c'
	'3e0faf4c5ef6a836001af09b90ebb7f9a0e3b9dc42c1a312815f4ad9c4dc1ed79672539cecdbaf7ce01f2297a76dc3f17579f058c5515d8f328fc286705192b6'
	'7508b5e6ca43f44eeecd8b91ca8bdfe3350a37601d8c626ce300435d0e3976ae48068ed014c7b4e1712359ef025fff59fef3a0a3adf5f5bf499129492f840df5'
	'f9df47354efda0ef25685e4dc13426a0f8ee2ba61a7af5af18eaaa00de142d0a60208a3f8c7002ea85922cda666288e156ff81449c0e4d74c0931de481b84092'
	'10f4f244708d081fa6a71e5e0e9478a7a3f730f1e97d9864723d4ed0a0321ab5f3c5b11b712753d46618a70f391c3c0226e221e4111954be3dc73b2947abea0f'
	'c3139235f6ddc5e9ddd3fe9fb7d129674b26930a4aa5eeb4ec822585ee3817f3e043610d2facd058c40eff3ec482a3b82782eb9559cd87c335748a0426243da5'
)

prepare() {
	cd yuzu-mainline
	git submodule init externals/{mbedtls,soundtouch}
	git config submodule.mbedtls.url ../yuzu-mbedtls
	git config submodule.soundtouch.url ../citra-soundtouch
	git submodule update
	install -Dm644 "../gamedb-$(date -I).json" ../build/dist/compatibility_list/compatibility_list.json
	patch -Np1 < ../unbundle-catch2.patch
	patch -Np1 < ../unbundle-cubeb.patch
	patch -Np1 < ../unbundle-discord-rpc.patch
	patch -Np1 < ../unbundle-dynarmic.patch
	patch -Np1 < ../unbundle-httplib.patch
	patch -Np1 < ../unbundle-inih.patch
	patch -Np1 < ../unbundle-sirit.patch
	patch -Np1 < ../unbundle-xbyak.patch
	rm .gitmodules
}

build() {
	cmake -S yuzu-mainline -B build -G Ninja \
		-DBUILD_REPOSITORY=yuzu-emu/yuzu-mainline \
		-DBUILD_TAG=${pkgver/.0./-} \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDISPLAY_VERSION=${pkgver##*.} \
		-DENABLE_COMPATIBILITY_LIST_DOWNLOAD=OFF \
		-DENABLE_QT_TRANSLATION=ON \
		-DTITLE_BAR_FORMAT_IDLE="yuzu {}" \
		-DTITLE_BAR_FORMAT_RUNNING="yuzu {} | {}" \
		-DUSE_DISCORD_PRESENCE=ON \
		-DYUZU_ENABLE_COMPATIBILITY_REPORTING=ON \
		-DYUZU_TESTS="$CHECKFUNC" \
		-DYUZU_USE_BUNDLED_BOOST=OFF \
		-DYUZU_USE_BUNDLED_FFMPEG=OFF \
		-DYUZU_USE_BUNDLED_LIBUSB=OFF \
		-DYUZU_USE_BUNDLED_QT=OFF \
		-DYUZU_USE_BUNDLED_SDL2=OFF \
		-DYUZU_USE_EXTERNAL_SDL2=OFF \
		-DYUZU_USE_QT_WEB_ENGINE=ON \
		-Wno-dev
	cmake --build build
}

check() {
	cmake --build build --target test
}

package() {
	depends+=(
		'libavcodec.so'
		'libavutil.so'
		'libboost_context.so'
		'libcubeb.so'
		'libdiscord-rpc.so'
		'libdynarmic.so'
		'libfmt.so'
		'libhttplib.so'
		'libINIReader.so'
		'libsirit.so'
		'libswscale.so'
		'libusb-1.0.so'
		'libzip.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
}
