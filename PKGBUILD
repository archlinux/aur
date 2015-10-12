# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=kqoauth-git
pkgname=('kqoauth-qt4-git' 'kqoauth-qt5-git')
pkgver=0.98.6.g7c31a12
pkgrel=1
pkgdesc="A library written in C++ for Qt that implements the OAuth 1.0 authentication specification RFC 5849. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/kypeli/kQOAuth'
license=('LGPL2.1')
makedepends=('qt5-base'
             'qt4'
             )
source=('kqoauth::git+https://github.com/kypeli/kQOAuth.git')
sha1sums=('SKIP')

pkgver() {
  cd kqoauth
  echo "$(git describe --long --tags |tr - .)"
}

prepare(){
  mkdir -p build-qt{4,5}
}

build() {
  cd build-qt4
  qmake-qt4 ../kqoauth
  make

  cd ../build-qt5
  qmake-qt5 ../kqoauth
  make
}

package_kqoauth-qt4-git() {
  pkgdesc="A library written in C++ for Qt that implements the OAuth 1.0 authentication specification RFC 5849. Qt4 Build. (GIT version)"
  depends=('qt4')
  provides=('kqoauth-qt4')
  conflicts=('kqoauth-qt5')
  make -C build-qt4 INSTALL_ROOT="${pkgdir}" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}

package_kqoauth-qt5-git() {
  pkgdesc="A library written in C++ for Qt that implements the OAuth 1.0 authentication specification RFC 5849. Qt5 Build. (GIT version)"
  depends=('qt5-base')
  provides=('kqoauth-qt5')
  conflicts=('kqoauth-qt4')
  make -C build-qt5 INSTALL_ROOT="${pkgdir}" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;
}