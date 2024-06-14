# Maintainer: username227 <gfrank227 at gmail dot com>
# The pkgbuild is based on the original pkgbuild for citra.

pkgname=lime3ds
pkgver=2114.1
pkgrel=2
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/Lime3DS/Lime3DS'
license=('GPL-2.0')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet' 'zydis')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'libc++' 'ninja')
conflicts=('lime3ds-appimage' 'lime3ds-git')
options=('lto' '!buildflags')
source=("lime3ds::https://github.com/Lime3DS/Lime3DS/releases/download/$pkgver/$pkgname-unified-source-$pkgver.tar.xz")
md5sums=('9b27950839f132814407bd2609e46f7b')

build() {
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/lib/libusb-1.0"
    
    cmake -B build -S "$pkgname-unified-source-$pkgver" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
    	-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
    	-DENABLE_QT_TRANSLATION=ON \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DCMAKE_CXX_FLAGS="-O2" \
    	-DCMAKE_C_FLAGS="-O2"
    cd build
    ninja
}

package() {   
    DESTDIR="$pkgdir/" ninja -C build install
}
