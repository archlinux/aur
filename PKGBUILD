# Maintainer: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.2.0
pkgrel=1
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/iwalton3/jellyfin-media-player'
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git')
source=("https://github.com/iwalton3/jellyfin-media-player/archive/refs/tags/v${pkgver}.tar.gz"
        'https://github.com/iwalton3/jellyfin-web-jmp/releases/download/jwc-1.7.0-2/dist.zip'
        'VersionConfiguration.cmake.patch')
sha256sums=('5d6d6d0ffa10ff001cfb1e936c324bac6245b126e97f1c4c45b538bf64548e2e'
            'd20c47c10247e2d91588b4bead4f7e9c29be1f76803de1924692edb10ee94dc4'
            'b8d9c283b4574cf791b46625295cfae8709e96e0e243c80d31754be13066ebcd')

prepare() {
    cd "${srcdir}/jellyfin-media-player-${pkgver}"
    
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
