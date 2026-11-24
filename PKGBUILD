# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar
pkgver=2127.0
pkgrel=2
epoch=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-2.0-or-later')
depends=('crypto++' 'soundtouch' 'fmt' 'libstdc++' 'libgcc' 'glibc' 'glslang' 'openssl' 'zydis' 'libretro-core-info' 'boost-libs' 'enet' 'libbacktrace')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'rapidjson' 'doxygen' 'graphviz' 'nlohmann-json' 'spirv-headers'
	     'catch2' 'libinih' 'boost')
source=("$url/releases/download/${pkgver}/azahar-unified-source-$pkgver.tar.xz")
sha256sums=('c817b4cd96169413165e87809cd5e7135a54f858e327abf60bfa1e55b36f71e7')
# Azahar 2127.0 now requires ffmpeg 7.1, and there is no submodule or CPM
# For users who know they want ffmpeg 7.1 functionality, please set _ffmpeg to ON.
_ffmpeg=OFF
if [[ $_ffmpeg == ON ]]
then
       depends+=( 'ffmpeg7.1')
       export PKG_CONFIG_PATH="/usr/lib/ffmpeg7.1/pkgconfig:$PKG_CONFIG_PATH"
fi

prepare() {
	cd "$srcdir/azahar-unified-source-$pkgver"
}

build() {
	cd "$srcdir"
	[[ $(grep -o sse4_2 /proc/cpuinfo | sed -n 1p) = sse4_2 ]] && local _SSE=ON && echo "SSE4.2 Enabled"
	cmake -B build -S "azahar-unified-source-$pkgver" -G Ninja \
	-DCMAKE_C_FLAGS="${CFLAGS} -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -DNDEBUG" \
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
	-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DENABLE_DISCORD_RPC=ON \
	-DUSE_SYSTEM_BOOST=ON \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_CRYPTOPP=ON \
	-DUSE_SYSTEM_ENET=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_QT=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=ON \
	-DUSE_SYSTEM_ZSTD=OFF \
	-DENABLE_FFMPEG="${_ffmpeg}" \
	-DCITRA_USE_PRECOMPILED_HEADERS=OFF \
	-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
	-DENABLE_QT_TRANSLATION=ON \
	-DENABLE_SSE42=$_SSE \
	-DENABLE_LTO=OFF \
	-DENABLE_TESTS=OFF \
	-Wno-author \
	-DENABLE_LIBRETRO=ON

	cmake --build build
}


package() {
	cd "$srcdir"
	#DESTDIR="$pkgdir" cmake --install build
	install -Dm755 build/bin/None/azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 "$srcdir/azahar-unified-source-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
