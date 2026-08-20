# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
# Contributor: Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-desktop-git
pkgver=r2117.4e1010b
pkgrel=1
epoch=1
license=('GPL-2.0-only')
pkgdesc="Jellyfin Desktop Client"
arch=('x86_64')
url="https://github.com/jellyfin/jellyfin-desktop"
depends=(
    'libcec'
    'mpvqt'
    'qt6-webengine'
    'qt6-declarative'
)
makedepends=(
    'cmake'
    'git'
    'ninja'
)

provides=('jellyfin-desktop')
conflicts=('jellyfin-desktop')
source=("git+${url}.git")
sha256sums=('SKIP')


pkgver() {
  cd jellyfin-desktop
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
    cd jellyfin-desktop
    rm -rf build
    mkdir build
    cmake \
        -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT=build/qt \
        -Wno-author
    cmake --build build
}

package() {
    cd jellyfin-desktop
    DESTDIR="${pkgdir}" cmake --install build
}
