# Maintainer: Ivan Puntiy <ivan.puntiy-at-gmail>
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=mingw-w64-libdxfrw
pkgver=0.5.12
pkgrel=2
pkgdesc="C++ library to read/write DXF files in binary and ascii form (mingw-w64)"
arch=("any")
url="http://sourceforge.net/projects/libdxfrw/"
license=('GPL2')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags staticlibs)
source=("https://downloads.sourceforge.net/project/libdxfrw/libdxfrw-${pkgver}.tar.bz2")
md5sums=('a901dddc2f6b973d2460c504cdb75d38')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "$srcdir/libdxfrw-$pkgver"

  # fix to create the dll (thanks to xantares)
  sed -i "s|libdxfrw_la_LDFLAGS =|libdxfrw_la_LDFLAGS = -no-undefined|g" Makefile.am
  sed -i "s|bzip2|bzip2 subdir-objects|g" configure.ac

  ./autogen.sh
}

build() {
  unset LDFLAGS
  cd "$srcdir/libdxfrw-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ../configure \
      --prefix=/usr/${_arch} \
      --host=${_arch} --build="$CHOST"
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libdxfrw-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et:
