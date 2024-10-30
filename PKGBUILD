# Maintainer: username227 <gfrank227 at gmail dot com>
# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# The pkgbuild is based on the original pkgbuild for citra.

pkgname=lime3ds
pkgver=2119
pkgrel=1
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/Lime3DS/Lime3DS'
license=('GPL-2.0-or-later')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'zydis' 'boost-libs')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'ninja' 'boost')
conflicts=('lime3ds-appimage' 'lime3ds-git')
options=('!lto')
source=("https://github.com/Lime3DS/Lime3DS/releases/download/$pkgver/$pkgname-unified-source-$pkgver.tar.xz")
md5sums=('53cf48001742297e418f7a2fd2cf478c')

build() {
    # Fix to help cmake find libusb
    export CFLAGS=$(echo $CFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    export CXXFLAGS=$(echo $CXXFLAGS | sed 's/-Wp,-D_FORTIFY_SOURCE=3//g')
    CXXFLAGS+=" -I/usr/lib/libusb-1.0 -flto=thin"
    CFLAGS+=" -flto=thin"
    
    cmake -B build -S "$pkgname-unified-source-$pkgver" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=None \
    	-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
    	-DENABLE_QT_TRANSLATION=ON \
    	-DUSE_DISCORD_PRESENCE=ON \
	-DCMAKE_C_FLAGS="$CFLAGS" \
	-DCMAKE_CXX_FLAGS="$CXXFLAGS" \
	-DUSE_SYSTEM_CATCH2=ON \
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
	-DUSE_SYSTEM_ZSTD=ON
    cd build
    ninja
}

package() {   
    DESTDIR="$pkgdir/" ninja -C build install
    rm -rf $pkgdir/usr/include/
}
