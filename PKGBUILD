# Maintainer: Thomas Poechtrager <tpoechtrager at g m a i l>

pkgname=mingw-w64-libircclient
pkgver=1.8
pkgrel=1
pkgdesc="Small but powerful library, which implements client-server IRC protocol (mingw-w64)"
arch=(any)
url='http://www.ulduzsoft.com/libircclient/'
license=('LGPL')
makedepends=(mingw-w64-gcc mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!libtool staticlibs !strip !buildflags)
source=(http://downloads.sourceforge.net/sourceforge/libircclient/libircclient-$pkgver.tar.gz
        Makefile)
sha256sums=('2cf8523ac683588f2785b08159a2df3e4d15939ee655c0024aa86334149de8f6'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/libircclient-${pkgver}
  cp ../Makefile .
}

build() {
  cd ${srcdir}/libircclient-${pkgver}

  # Fix some brokenness.

  find . -name '*.c' -o -name '*.h' -exec \
    sed -i "s/defined (WIN32)/defined (_WIN32)/g" {} \;

  sed -i "s/int nsock/socket_t nsock/g" src/dcc.c

  for _arch in ${_architectures}; do
    mkdir build-${_arch} && pushd build-${_arch}
    mkdir src && pushd src

    # libircclient's configure script doesn't like building
    # outside the root directory, so we must use a custom Makefile.
    sed -i "s/i686-w64-mingw32/${_arch}/g" ../../Makefile
    make -f ../../Makefile
    rm ../../src/libircclient.o

    popd
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libircclient-${pkgver}/build-${_arch}/src"
    mkdir -p $pkgdir/usr/${_arch}/bin $pkgdir/usr/${_arch}/lib $pkgdir/usr/${_arch}/include/libircclient
    cp libircclient.dll $pkgdir/usr/${_arch}/bin
    cp libircclient.dll.a $pkgdir/usr/${_arch}/lib
    cp libircclient.a $pkgdir/usr/${_arch}/lib

    # The header files do not really belong into include/libircclient,
    # but it's what the Arch maintainers are doing, so just follow them.
    cp ../../include/*.h $pkgdir/usr/${_arch}/include/libircclient

    # Add symlinks so "#include <libircclient.h>" works too.
    ln -rs $pkgdir/usr/${_arch}/include/libircclient/* $pkgdir/usr/${_arch}/include

    find "$pkgdir/usr/${_arch}" -name '*.exe' -o -name '*.bat' -o -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip -x
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
