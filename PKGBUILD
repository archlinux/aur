# Maintainer: username227 <gfrank227 at gmail dot com>
# The pkgbuild is based on the original pkgbuild for citra.

pkgname=lime3ds
_pkgname=unified-source-20240517-ceb97be
pkgver=2113
pkgrel=4
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/Lime3DS/Lime3DS'
license=('GPL-2.0')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'libc++' 'ninja')
conflicts=('lime3ds-appimage' 'lime3ds-git' 'citra')
options=('lto' '!buildflags')
source=("lime3ds::https://github.com/Lime3DS/Lime3DS/releases/download/2113/lime3ds-$_pkgname.tar.xz")
md5sums=('4fe007c27741f393a7d97ceed4b96a4b')

build() {
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/lib/libusb-1.0"
    
    cmake -B build -S "$pkgname-$_pkgname" -G Ninja \
	-DCMAKE_BUILD_TYPE=Release \
    	-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
    	-DENABLE_QT_TRANSLATION=ON \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DCMAKE_CXX_FLAGS="-O2" \
    	-DCMAKE_C_FLAGS="-O2"
    cd build
    ninja
    strip -s bin/Release/*
}

package() {   
    DESTDIR="$pkgdir/" ninja -C build install
}
