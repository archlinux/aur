# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ian Yang <doit.ian@gmail.com>

_pkgname=glog
pkgname=mingw-w64-google-$_pkgname
pkgver=0.4.0
pkgrel=1
pkgdesc="Logging library for C++ (mingw-w64)"
arch=(any)
license=('custom:BSD3')
url='https://github.com/google/glog'
makedepends=('make' 'mingw-w64-cmake')
options=(!strip !buildflags staticlibs)
source=("glog-$pkgver.tar.gz::https://github.com/google/glog/archive/v$pkgver.tar.gz")
sha512sums=('b585f1819ade2075f6b61dc5aaca5c3f9d25601dba2bd08b6c49b96ac5f79db23c6b7f2042df003f7130497dd7241fcaa8b107d1f97385cb66ce52d3c554b176')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  #unset LDFLAGS
  cd $_pkgname-$pkgver
  sed -i "/endif (HAVE_DBGHELP)/atarget_link_libraries (glog PUBLIC dbghelp ssp)" CMakeLists.txt
  sed -i "s/check_symbol_exists (snprintf stdio.h HAVE_SNPRINTF)/set (HAVE_SNPRINTF 1)/" CMakeLists.txt
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
  cd $_pkgname-$pkgver
  for _arch in ${_architectures}; do
    pushd build-$_arch
    make DESTDIR="$pkgdir" install
    popd
    pushd build-$_arch-static
    make DESTDIR="$pkgdir" install
    popd
    # Lazy way of dealing with conflicting man and info pages...
    rm -rf "${pkgdir}/usr/${_arch}/share"
    rm -rf "${pkgdir}/usr/${_arch}/lib/cmake/"
    install -D -m644 COPYING "$pkgdir"/usr/${_arch}/share/licenses/google-$_pkgname/COPYING
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

