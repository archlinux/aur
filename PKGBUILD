# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=mingw-w64-gfsm
_pkgname=gfsm
pkgver=0.0.15.1
_pkgver=0.0.15-1
pkgrel=4
pkgdesc="A weighted finite state transducer (WFST) library and associated command line tools. (mingw-w64)"
arch=(any)
url="http://kaskade.dwds.de/~moocow/mirror/projects/gfsm/"
license=('LGPL')
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-glib2)
options=(!strip !buildflags staticlibs)
source=(http://kaskade.dwds.de/~moocow/mirror/projects/gfsm/${_pkgname}-${_pkgver}.tar.gz 
        getdelim.patch)
md5sums=('e13ca735ee146d242b33d4de74fb6157'
         '46825b464058f1ab72b3361d29123716')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/$_pkgname-$_pkgver"
  patch -p1 < ../getdelim.patch
  find . -name Makefile.am | xargs -i sed -i "s/_la_LDFLAGS = /_la_LDFLAGS = -no-undefined /" {}
  sed -i 's/AM_PROG_LIBTOOL/AC_LIBTOOL_WIN32_DLL\nAM_PROG_LIBTOOL/' configure.ac
  rm -rf m4
  sh autogen.sh
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure 
    make 
    popd
  done
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  for _arch in ${_architectures}; do
    pushd build-${_arch}
    make DESTDIR="$pkgdir/" install
    rm -rf "${pkgdir}"/usr/${_arch}/share
    rm -rf "${pkgdir}"/usr/${_arch}/bin/*.exe
    find "${pkgdir}"/usr/${_arch} -name \*.dll | xargs ${_arch}-strip --strip-unneeded
    find "${pkgdir}"/usr/${_arch} -name \*.a | xargs ${_arch}-strip -g
    popd
  done
}

# vim:set ts=2 sw=2 et:
