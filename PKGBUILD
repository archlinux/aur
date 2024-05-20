# Maintainer: username227 <gfrank227 at gmail dot com>

pkgname=citra
_pkgname=unified-source-20240516-64e3e9f
pkgver=r64e3e9f
pkgrel=1
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/PabloMK7/citra'
license=('GPL-2.0')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'libc++' 'ninja')
conflicts=('citra-appimage' 'lime3ds' 'lime3ds-git')
options=('lto' '!buildflags')
source=("citra::https://github.com/PabloMK7/citra/releases/download/r64e3e9f/citra-unified-source-20240516-64e3e9f.tar.xz")
md5sums=('c87ec94212afa24caa142e6bd1694211')

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
