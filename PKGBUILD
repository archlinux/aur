# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-pmp-location
_qtver=5.9.5
pkgver=${_qtver/-/}
pkgrel=2
arch=('x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides access to position, satellite and area monitoring classes (for plex-media-player)'
depends=('qt5-pmp-declarative')
makedepends=('gconf')
groups=('qt5-pmp')
_pkgfqn="${pkgname/5-pmp-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('41f0390e1709140e3590bed434e63ec00406fac2051529c400c756acbb70a80e')

prepare() {
  mkdir -p build
}

build() {
  cd build

  /opt/qt5-pmp/usr/bin/qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/opt/qt5-pmp/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/opt/qt5-pmp/usr/share/licenses
  ln -s /opt/qt5-pmp/usr/share/licenses/qt5-base "$pkgdir"/opt/qt5-pmp/usr/share/licenses/${pkgname}
}
