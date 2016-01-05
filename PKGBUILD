# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kqoauth-git
pkgver=0.98.6.g7c31a12
pkgrel=1
pkgdesc="A library written in C++ for Qt that implements the OAuth 1.0 authentication specification RFC 5849. (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/kypeli/kQOAuth'
license=('LGPL2.1')
depends=('qt5-base')
provides=('kqoauth')
conflicts=('kqoauth')
source=('kqoauth::git+https://github.com/kypeli/kQOAuth.git')
sha1sums=('SKIP')

pkgver() {
  cd kqoauth
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build
}

build() {

  cd build
  qmake-qt5 ../kqoauth
  make
}


package() {
  make -C build INSTALL_ROOT="${pkgdir}" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/usr/lib" -type f -name '*.prl' -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  # Fix pkgconfig file
  sed 's|QtCore QtNetwork|Qt5Core Qt5Network|g' -i "${pkgdir}/usr/lib/pkgconfig/kqoauth.pc"
}