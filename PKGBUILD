# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=synnefo-git
pkgname=('synnefo-qt4-git' 'synnefo-qt5-git')
pkgver=1.1.0.r167.cf5e48f
pkgrel=1
pkgdesc="A Qt based front end for the ICC based Oyranos Color Management System. (GIT version)"
arch=('i686' 'x86_64')
url="http://www.oyranos.org/synnefo/"
license=('BSD')
makedepends=('qt4' 'qt5-base' 'git' 'cmake' 'oyranos-git')
conflicts=('synnefo')
source=('synnefo::git+https://github.com/oyranos-cms/Synnefo.git'
        'COPYING')
sha1sums=('SKIP'
          '37cb5e34ad08d853124a42d06e273b2c6f33fe4b')

pkgver() {
  cd synnefo
  _ver="$(cat CMakeLists.txt | grep -m3 -e _MAJOR_VERSION -e _MINOR_VERSION -e _MICRO_VERSION | grep -o "[[:digit:]]*" | xargs)"
  echo -e "${_ver// /.}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-qt{4,5}
}

build() {
  cd "${srcdir}/build-qt4"
  cmake ../synnefo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=ON
  make

  cd "${srcdir}/build-qt5"
  cmake ../synnefo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=OFF
  make
}

package_synnefo-qt4-git() {
  pkgdesc="A Qt4 based front end for the ICC based Oyranos Color Management System. (GIT version)"
  depends=('oyranos-qt4-git')
  conflicts=('synnefo-qt4-git')
  provides=('synnefo' 'synnefo-qt4')
  install=synnefo-git.install

  make -C build-qt4 DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_synnefo-qt5-git() {
  pkgdesc="A Qt5 based front end for the ICC based Oyranos Color Management System. (GIT version)"
  depends=('oyranos-qt5-git')
  conflicts=('synnefo-qt5-git')
  provides=('synnefo' 'synnefo-qt5')
  install=synnefo-git.install

  make -C build-qt5 DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
