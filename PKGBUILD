# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.1.0
pkgrel=1
pkgdesc='Next generation jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/iwalton3/jellyfin-media-player'
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=("https://github.com/iwalton3/jellyfin-media-player/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/iwalton3/jellyfin-web-jmp/releases/download/v${pkgver}/dist.zip"
        'CMakeLists.txt.patch'
        'VersionConfiguration.cmake.patch'
        'main.cpp.patch'
        'src_CMakeLists.txt.patch')
sha256sums=('0b26d2c8cccb239bcf85138482f894c1ba6d0c0df8c44e4c38cd86d2fae6ee7c'
            'd2f5e7b3fbe44307dafd99b5212cf11e0c01f780e27211cdf3acb9753d03f0bf'
            'aca0a3ead028ca54c7ffd1eab719809a9bea3b23f5b9a0490c7f3054b47cb2a4'
            'b8d9c283b4574cf791b46625295cfae8709e96e0e243c80d31754be13066ebcd'
            '90e5f7966c7999b030dc705a9c2b272f2293884a200617f7587ff9d4edc57467'
            '854dd8df54a0e2922e24d40fae6dc390c347f91a932311c239598382c9f83b3e')

prepare() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}"
    
    # disable breakpad crash reporter (now in master branch)
    patch -u CMakeLists.txt -i ../CMakeLists.txt.patch 
    patch -u src/CMakeLists.txt -i ../src_CMakeLists.txt.patch 
    patch -u src/main.cpp -i ../main.cpp.patch

    # fix building without git repo
    patch -u CMakeModules/VersionConfiguration.cmake -i ../VersionConfiguration.cmake.patch
}

build() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}"
    mkdir -p build
    cd build
    cp -r "${srcdir}/dist" .
    cmake -DCMAKE_INSTALL_PREFIX='/usr/' -DCMAKE_BUILD_TYPE='Release' -DQTROOT=./qt -DCMAKE_SKIP_RPATH=1 ..
    make
}

package() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}/build"
    DESTDIR="${pkgdir}" make install
}
