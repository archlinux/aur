# Maintainer: pingplug < aur at pingplug dot me >
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Stas Elensky <stas-at-flexsys-dot-com-dot-ua>

_pkgname=libmodbus
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libmodbus
pkgver=3.1.12
pkgrel=1
pkgdesc="A Modbus library for Linux, Mac OS X, FreeBSD, QNX and Win32 (mingw-w64)"
arch=('any')
url="https://libmodbus.org/"
license=('LGPL-2.1-or-later')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=(!strip !buildflags staticlibs)
source=("https://github.com/stephane/libmodbus/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        "dde16d5.diff")
sha256sums=('2f4d4191cd196c1fba131daec03b621db75129d8255c832fc66b259d9fc46e7b'
            '527967d510ae84b222e950e0cb260c6f76447782beaaa8a2088ece64d46f4d72')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # revert commit which breaks windows api
  patch -NRp1 -i ../dde16d5.diff
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
