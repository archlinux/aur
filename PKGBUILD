# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=dtk6gui-git
pkgver=6.0.4.r0.g740cea5
pkgrel=1
sourcename=dtk6gui
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='Deepin Toolkit, gui module for DDE look and feel'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6gui"
license=('LGPL3')
depends=('dtk6core' 'dtkcommon' 'gcc-libs' 'qt6-base' 'qt6-svg' 'freeimage' 'librsvg')
# INFO: you can disable freeimage not to support RAW images
# Then set DTK_DISABLE_EX_IMAGE_FORMAT=OFF
makedepends=('git' 'qt6-tools' 'gtest' 'gmock' 'ninja' 'cmake' 'doxygen' 'pkg-config' 'gcc')
conflicts=('dtk6gui')
provides=('dtk6gui')
groups=('deepin-git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd $sourcedir
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $sourcedir
    version=$(git describe --long --tags | awk -F'[+_~-]' '{print $1}')
    cmake -GNinja \
    -DMKSPECS_INSTALL_DIR=lib/qt6/mkspecs/modules/ \
    -DBUILD_DOCS=OFF \
    -DDTK_DISABLE_LIBRSVG=ON \
    -DDTK_DISABLE_LIBXDG=ON \
    -DQCH_INSTALL_DESTINATION=share/doc/qt6 \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DDTK_VERSION=$version

    ninja
    # INFO: Another cmake option is DTK_DISABLE_EX_IMAGE_FORMAT
    # If you not want to support RAW images, set it to off
}

package() {
    cd $sourcedir
    DESTDIR="$pkgdir" ninja install
}
