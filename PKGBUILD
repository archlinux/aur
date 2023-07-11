# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Maël Lavault <moimael@neuf.fr>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Samuel Mesa <samuelmesa@linuxmail.org>
# Maintainer: Alireza S.N. <alireza6677@gmail.com> 

pkgname=libkml-git
_pkgname=libkml
pkgver=1062.878abd1
pkgrel=1
pkgdesc="A KML library written in C++ with bindings to other languages"
arch=('i686' 'x86_64')
url="https://github.com/libkml/libkml"
license=('BSD')
depends=('expat' 'uriparser')
optdepends=('swig: bindings for additional languages'
            'python2: python bindings')
makedepends=('cmake' 'swig' 'boost' 'patchelf')
provides=('libkml')
conflicts=('libkml')
source=("libkml::git+https://github.com/libkml/libkml.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd ${_pkgname}
  git checkout synced_upstream
}

build() {
  cd ${_pkgname}

  if [ -f CMakeCache.txt ]  
    then
    rm -rf CMakeCache.txt CMakeFiles
  fi  

  rm -rf build && mkdir build
  cd build

   cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_SWIG=OFF \
    -DWITH_PYTHON=OFF \
    -DBUILD_EXAMPLES=OFF

  # Add --disable-python or --disable-java to configure flags if your
  # system doesn't have corresponding language.

  make clean
  make 
}

package() {
  cd ${_pkgname}
  cd build

  make || return 1
  make DESTDIR=${pkgdir} install
  patchelf --add-needed liburiparser.so.1 $pkgdir/usr/lib/libkmlbase.so
}
