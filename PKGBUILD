# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>

_pkgname=libmodbus
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libmodbus
pkgver=3.1.10
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (mingw-w64)"
arch=('any')
url="https://libmodbus.org/"
license=('LGPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("https://github.com/stephane/libmodbus/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('899be4e25ab7fe5799d43f9567510d6f063d2e8f56136dd726b6fd976f9b2253')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  unset CFLAGS
  unset LDFLAGS
  export ac_cv_func_malloc_0_nonnull=yes

  cd "$srcdir/${_pkgname}-${pkgver}"

  # skip tests
  sed -i 's/ tests//' Makefile.am

  for _arch in ${_architectures}; do
    mkdir -p build-${_arch}
    pushd build-${_arch}
    ${_arch}-configure --without-documentation ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install

    find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
  done
}

# vim:set ts=2 sw=2 et:
