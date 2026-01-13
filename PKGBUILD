# Maintainer: Odin Vex <https://aur.archlinux.org/account/OdinVex/>
# Contributor Andrew Rabert <ar@nullsum.net>

pkgname=jellyfin-media-player
pkgver=1.12.0
pkgrel=6
pkgdesc='Jellyfin Desktop Client - Legacy'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/jellyfin/jellyfin-desktop'
conflicts=('jellyfin-desktop')
depends=('mpv' 'libcec' 'sdl2' 'p8-platform' 'protobuf' 'qt5-webengine' 'qt5-x11extras' 'qt5-quickcontrols')
makedepends=('cmake' 'git' 'python')
source=("https://github.com/jellyfin/jellyfin-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        "disable-update-check.patch"
        "fix-cmake-4.patch"
        "fix-gpu-acceleration.patch")
sha256sums=('036d841f6440806fd9f45cccf40223e5dd904ae09d508b29ef1b0583bd3d277e'
            '2aef728dfdef17f089186d1a2b604837678fa896b4c299dd710b6f37d290aba0'
            '7ff8a15d9e9a7bc9a75bc9f0ee730408827827f6f6d564686ac9f9ca26525342'
            '837cee6d50d143a5f1d959741c26904d3ebd82053027c07bd725c0b871e1af2f')

prepare() {
    cd "${srcdir}/jellyfin-desktop-${pkgver}"
    for patch_file in ../*.patch; do
        patch -Np1 < "${patch_file}"
    done
}

build() {
    cd "${srcdir}/jellyfin-desktop-${pkgver}"
    rm -rf build
    mkdir build
    cmake \
        -B build \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr/' \
        -DCMAKE_SKIP_RPATH=1 \
        -DQTROOT=build/qt \
        -DCHECK_FOR_UPDATES=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    cd "${srcdir}/jellyfin-desktop-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
}
