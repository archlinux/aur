# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkcore-git
_pkgname=dtkcore
pkgver=5.6.22.r0.g9c96f05
pkgrel=1
pkgdesc='DTK core modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkcore"
license=('LGPL3')
depends=('dconf' 'deepin-desktop-base' 'python' 'gsettings-qt' 'lshw')
makedepends=('git' 'qt5-tools' 'uchardet' 'gtest' 'dtkcommon' 'cmake' 'ninja' 'doxygen')
conflicts=('dtkcore')
provides=('dtkcore')
groups=('deepin-git')
source=("git+https://github.com/linuxdeepin/dtkcore.git")
sha512sums=('SKIP')

pkgver() {
    cd $srcdir/$_pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -GNinja \
      -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules/\
      -DBUILD_DOCS=ON \
      -DBUILD_EXAMPLES=OFF \
      -DQCH_INSTALL_DESTINATION=share/doc/qt \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DD_DSG_APP_DATA_FALLBACK=/var/dsg/appdata
  cmake --build build
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
}
