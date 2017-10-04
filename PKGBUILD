# Maintainer: twa022 <twa022 at gmail dot com>

_pkgbase='alkimia'
pkgbase='libalkimia'
pkgname=("${pkgbase}-qt4" "${pkgbase}-qt5")
pkgver=7.0.0
pkgrel=1
pkgdesc="A library with common classes and functionality used by QT finance applications."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/libalkimia?content=137323"
license=('LGPL')
makedepends=('extra-cmake-modules' 'automoc4' 'doxygen' 'qt4' 'qt5-base')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/KDE/alkimia/archive/${pkgver}.tar.gz")
sha256sums=('857f26b7b64d47837ea2494f8bea6ca9a1cbc5cdca4841104a027fc422af5d21')

build() {
  cd "${srcdir}"

  rm -fr build.qt{4,5}
  mkdir build.qt{4,5}
  cd build.qt4

  cmake ../${_pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_QT4=1 \
    -Wno-dev
  make
  
  cd "${srcdir}"/build.qt5
  cmake ../${_pkgbase}-${pkgver} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=/usr/lib \
    -DCMAKE_BUILD_TYPE=Release \
    -Wno-dev
  make
}

package_libalkimia-qt4() {
  pkgdesc="${pkgdesc/QT/qt4}"
  depends=('qt4')
  conflicts=('libalkimia')
  provides=("libalkimia=${pkgver}")
  replaces=('libalkimia')
  cd "${srcdir}"/build.qt4
 
  make DESTDIR="${pkgdir}" install  
}

package_libalkimia-qt5() {
  pkgdesc="${pkgdesc/QT/qt5}"
  depends=('qt5-base')
  cd "${srcdir}"/build.qt5
 
  make DESTDIR="${pkgdir}" install  
}
