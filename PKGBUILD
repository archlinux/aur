# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-enginio
_qtver=5.6.0
_enginiover=1.6.0
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='A Backend-as-a-Service solution to ease the backend development for connected and data-driven application'
depends=('qt5-base')
makedepends=('qt5-declarative')
optdepends=('qt5-declarative: QML bindings')
conflicts=('qt')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_enginiover}"
source=("http://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
md5sums=('67362f39eca4316905f86cbba653309b')

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

