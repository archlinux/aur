# $Id: PKGBUILD 293803 2017-04-21 11:54:59Z arojas $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qt5-remoteobjects
_qtver=5.9.1
pkgver=${_qtver/-/}
pkgrel=2
arch=(i686 x86_64)
url='http://qt-project.org/'
license=(GPL3 LGPL3 FDL custom)
pkgdesc='Inter-process communication (IPC) module developed for Qt'
depends=(qt5-base)
makedepends=(qt5-declarative)
optdepends=('qt5-declarative: QML bindings')
groups=(qt qt5)
_pkgfqn="${pkgname/5-/}-opensource-src-${_qtver}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('a04ef16017903050a4afefb64f1d6a88fadb3c9b3668b320d6dfc4fa1cc07c82')

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
