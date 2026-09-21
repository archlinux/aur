# Maintainer: Zen Wen <zen.8841@gmail.com>
# Contributor: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-desktop
pkgver=2.0.0
pkgrel=5
pkgdesc='Jellyfin Desktop Client'
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
url='https://github.com/jellyfin/jellyfin-desktop'
depends=('mpv' 'mpvqt' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt6-webengine' 'qt6-declarative')
makedepends=('cmake' 'git' 'ninja' 'python')
#source=("https://github.com/jellyfin/jellyfin-desktop/archive/refs/tags/v${pkgver}.tar.gz")
source=("git+https://github.com/jellyfin/jellyfin-desktop.git#tag=v${pkgver}")
sha256sums=('43067703588e5ae375507f38bcc421aeeebe08ac86edca17cab4ea98bb5b31dc')

prepare() {
    cd "${srcdir}/jellyfin-desktop"
    git submodule update --init --recursive
}
build() {
    cd "${srcdir}/jellyfin-desktop"
    rm -rf build
    mkdir build
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='Release' \
        -DUSE_STATIC_MPVQT=ON \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT=build/qt \
        -Wno-author
    cmake --build build
}

package() {
    cd "${srcdir}/jellyfin-desktop"
    DESTDIR="${pkgdir}" cmake --install build
}
