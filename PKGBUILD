# $Id: PKGBUILD 240297 2015-06-03 10:22:03Z fyan $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-3d
_qtver=5.6.1
pkgver=${_qtver/-/}
pkgrel=1
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='C++ and QML APIs for easy inclusion of 3D graphics'
depends=('qt5-declarative')
makedepends=()
conflicts=('qt')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('8227248e5800be8d684a2700fca143e6')

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
