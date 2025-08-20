# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=azahar
pkgver=2123.1
pkgrel=1
epoch=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-2.0-or-later')
depends=('glibc' 'gcc-libs' 'qt6-base' 'crypto++' 'fmt' 'glslang' 'libusb' 'openal' 'openssl' 'sdl2' 'soundtouch'
	 'qt6-multimedia' 'zydis' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'rapidjson' 'doxygen' 'graphviz' 'nlohmann-json' 'clang' 'lld' 'spirv-headers'
	     'catch2' 'libinih' 'ffmpeg4.4' 'qt6-tools')
options=(!lto)
source=("$url/releases/download/${pkgver}/$pkgname-unified-source-$pkgver.tar.xz")
install=${pkgname}.install
sha256sums=('374ec56a6e2138e94e4a9af1398317a8e466c02d5d55b0f0163616e90d42208b')

prepare() {
	cd "$srcdir/$pkgname-unified-source-$pkgver"

	#Fix zstd include
	sed -i 's/zstd\/contrib\/seekable_format\///g' src/common/zstd_compression.cpp
}

build() {
	cd "$srcdir"
	[[ $(grep -o sse4_2 /proc/cpuinfo | sed -n 1p) = sse4_2 ]] && local _SSE=ON && echo "SSE4.2 Enabled"
	cmake -B build -S "$pkgname-unified-source-$pkgver" -G Ninja \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_FLAGS="${CFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
	-DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS -fuse-ld=lld" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
	-DUSE_DISCORD_PRESENCE=ON \
	-DUSE_SYSTEM_BOOST=OFF \
	-DUSE_SYSTEM_CATCH2=ON \
	-DUSE_SYSTEM_CRYPTOPP=ON \
	-DUSE_SYSTEM_FFMPEG_HEADERS=ON \
	-DUSE_SYSTEM_FMT=ON \
	-DUSE_SYSTEM_GLSLANG=ON \
	-DUSE_SYSTEM_INIH=ON \
	-DUSE_SYSTEM_JSON=ON \
	-DUSE_SYSTEM_LIBUSB=ON \
	-DUSE_SYSTEM_OPENAL=ON \
	-DUSE_SYSTEM_OPENSSL=ON \
	-DUSE_SYSTEM_SDL2=ON \
	-DUSE_SYSTEM_SOUNDTOUCH=ON \
	-DUSE_SYSTEM_VULKAN_HEADERS=ON \
	-DUSE_SYSTEM_ZSTD=OFF \
	-DCITRA_USE_PRECOMPILED_HEADERS=OFF \
	-DCMAKE_INCLUDE_PATH="/usr/include/ffmpeg4.4" \
	-DSIRIT_USE_SYSTEM_SPIRV_HEADERS=ON \
	-DENABLE_QT_TRANSLATION=ON \
	-DENABLE_SSE42=$_SSE \
	-Wno-dev

	cmake --build build
}


package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	rm -rf "$pkgdir/usr/include"
	rm -rf "$pkgdir/usr/lib"
	install -Dm644 "$srcdir/$pkgname-unified-source-$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/licenses.txt"
}
