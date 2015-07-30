# Maintainer: Tom Kuther <gimpel@sonnenkinder.org>
pkgname=tora-git
_gitname=tora
pkgver=3.0.0.git.692d6d7
pkgrel=1
pkgdesc="Toolkit for databases with support for Oracle, MySQL and PostgreSQL"
arch=('i686' 'x86_64')
url="http://torasql.com"
license=('GPL')
provides=('tora')
replaces=('tora')
conflicts=('tora')
depends=('oracle-instantclient-basic' 'graphviz' 'poppler' 'qt')
makedepends=('cmake' 'oracle-instantclient-sdk' 'git' 'boost')
options=()
install=$pkgname.install
source=('tora::git+https://github.com/tora-tool/tora.git'
        'tora.desktop')
md5sums=('SKIP'
         '089754af8d9d5a537d3ef44929f6aa28')

pkgver() {
  cd $_gitname
  _major=`grep 'SET (VERSION_MAJOR' CMakeLists.txt|awk -F'("|")' '{print $2}'`
  _minor=`grep 'SET (VERSION_MINOR' CMakeLists.txt|awk -F'("|")' '{print $2}'`
  _patch=`grep 'SET (VERSION_PATCH' CMakeLists.txt|awk -F'("|")' '{print $2}'`
  _gitrev=`git rev-parse --short HEAD`
  echo "${_major}.${_minor}.${_patch}.git.${_gitrev}"
}

build() {
  cd $_gitname

  test -d build && rm -rf build
  mkdir build
  cd build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_SUFFIX="" \
    -DBOOST_ROOT=/usr \
    -DBOOST_INCLUDEDIR=/usr/include/boost \
    -DBOOST_LIBRARYDIR=/usr/lib \
    -DENABLE_DB2=0 \
    -DENABLE_TERADATA=0 \
    -DQT5_BUILD=1 \
    -DWANT_INTERNAL_LOKI=1 \
    -DWANT_INTERNAL_QSCINTILLA=1 # needed for Qt5 

  make
}

package() {
  cd $_gitname/build
  make DESTDIR="${pkgdir}" install

  # -DLIB_SUFFIX="" breakage, fu...
  test -d "${pkgdir}"/usr/lib64 && mv "${pkgdir}"/usr/lib64 "${pkgdir}"/usr/lib

  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  install -m644 ../src/icons/tora.xpm "${pkgdir}/usr/share/pixmaps"
  install -m644 "${srcdir}"/tora.desktop "${pkgdir}/usr/share/applications"
}
