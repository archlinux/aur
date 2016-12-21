# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=qt5-enginio
_qtver=5.6.2
_enginiover=1.6.2
pkgver=${_qtver/-/}
pkgrel=2
arch=('i686' 'x86_64')
url='http://qt-project.org/'
license=('GPL3' 'LGPL' 'FDL' 'custom')
pkgdesc='Backend-as-a-Service solution to ease the backend development for connected and data-driven application'
depends=('qt5-base')
makedepends=('qt5-declarative')
optdepends=('qt5-declarative: QML bindings')
conflicts=('qt')
groups=('qt' 'qt5')
_pkgfqn="${pkgname/5-/}-opensource-src-${_enginiover}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/submodules/${_pkgfqn}.tar.xz")
sha512sums=('6b046bca3b7bd400d35e94ff194cd502607ac136057b0734b7e99b25f22328320065d46c25c087b163f17f1e71165e72113180e77490bf7e0033541c6ef79d16')

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
  make INSTALL_ROOT="${pkgdir}" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "${pkgdir}"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
