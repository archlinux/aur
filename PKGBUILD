# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>

pkgname=mingw-w64-libmodbus-dev
pkgver=3.1.4
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (development version) (mingw-w64)"
arch=('any')
url="http://libmodbus.org/"
license=('LGPL')
provides=('mingw-w64-libmodbus')
conflicts=('mingw-w64-libmodbus')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags staticlibs)
_pkgfqn="libmodbus-${pkgver}"
source=("http://libmodbus.org/releases/libmodbus-$pkgver.tar.gz")
md5sums=('b1a8fd3a40d2db4de51fb0cbcb201806')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset CFLAGS
  unset LDFLAGS

  cd "$srcdir/$_pkgfqn"

  # skip tests
  sed -i 's/ tests//' Makefile.am

  # fix for undefined reference to `rpl_malloc'
  export set ac_cv_func_malloc_0_nonnull=yes

  autoreconf --install --symlink --force

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    pushd build-${_arch}
    ../configure --prefix=/usr/${_arch} --host=${_arch} --without-documentation
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/$_pkgfqn/build-${_arch}"
    make DESTDIR="$pkgdir" install

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}

# vim:set ts=2 sw=2 et:
