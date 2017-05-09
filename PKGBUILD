# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ian Yang <doit.ian@gmail.com>

_pkgname=glog
pkgname=mingw-w64-google-$_pkgname
pkgver=0.3.5
pkgrel=1
pkgdesc="Logging library for C++ (mingw-w64)"
arch=(any)
license=('custom:BSD3')
url='https://github.com/google/glog'
makedepends=('make' 'mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
sha512sums=('68b42ef42d57c9ede697c1423f8490deada06c9e9cb11a5e0ce53368e7e452c087d0e23bea50f51e1634b03eb4105e657c91318b6423c4e2a9c147b7334eb3f3')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  cd $_pkgname
  sed -i "s/BaseTsd/basetsd/" src/logging.cc
  for _arch in ${_architectures}; do
    mkdir -p build-$_arch
    pushd build-$_arch
    $_arch-cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=ON
    make
    popd
    mkdir -p build-$_arch-static
    pushd build-$_arch-static
    $_arch-cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS:BOOL=OFF
    make
    popd
  done
}

package() {
  cd $_pkgname
  for _arch in ${_architectures}; do
    pushd build-$_arch
    make DESTDIR="$pkgdir" install
    popd
    pushd build-$_arch-static
    make DESTDIR="$pkgdir" install
    popd
    # Lazy way of dealing with conflicting man and info pages...
    rm -rf "${pkgdir}/usr/${_arch}/share"
    install -D -m644 COPYING "$pkgdir"/usr/${_arch}/share/licenses/$_pkgname/COPYING
  done
}

