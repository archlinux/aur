# Maintainer: justforlxz <justforlxz@gmail.com>
pkgname=dtk6widget-git
pkgver=6.0.4.r0.g45fc32d7
pkgrel=1
sourcename=dtk6widget
sourcetars=("$sourcename"_"$pkgver".tar.xz)
sourcedir="$sourcename"
pkgdesc='DTK6 widgets library for graphical user interface development'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtk6widget"
license=('LGPL3')
depends=('dtk6core' 'dtk6gui' 'gcc-libs' 'qt6-base' 'qt6-svg' 'dtkcommon' 'startup-notification')
makedepends=('git' 'qt6-tools' 'gtest' 'ninja' 'cmake' 'doxygen' 'pkg-config' 'gcc')
provides=('dtk6widget')
conflicts=('dtk6widget')
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
  cmake \
    -GNinja \
    -DDTK_VERSION=$version \
    -DMKSPECS_INSTALL_DIR=lib/qt6/mkspecs/modules/ \
    -DBUILD_PLUGINS=OFF \
    -DBUILD_DOCS=ON \
    -DQCH_INSTALL_DESTINATION=share/doc/qt6 \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  ninja
}

package() {
  cd $sourcedir
  DESTDIR="$pkgdir" ninja install
}
