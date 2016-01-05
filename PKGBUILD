# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=synnefo-git
pkgver=1.1.0.r182.04864a3
pkgrel=1
pkgdesc="A Qt based front end for the ICC based Oyranos Color Management System. (GIT version)"
arch=('i686' 'x86_64')
url='http://www.oyranos.org/synnefo'
license=('BSD')
makedepends=('git'
             'cmake'
             'qt5-tools'
             )
depends=('qt5-base'
         'oyranos-git'
         )
conflicts=('synnefo')
provides=('synnefo')
source=('synnefo::git+https://github.com/oyranos-cms/Synnefo.git')
sha1sums=('SKIP')
install=synnefo-git.install

pkgver() {
  cd synnefo
  _ver="$(cat CMakeLists.txt | grep -m3 -e _MAJOR_VERSION -e _MINOR_VERSION -e _MICRO_VERSION | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../synnefo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_Qt4=OFF
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 synnefo/COPYING.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
