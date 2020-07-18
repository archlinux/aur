# Maintainer: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libpsl
_pkgname=libpsl
pkgver=0.21.1
pkgrel=1
pkgdesc='Public Suffix List library (mingw-w64)'
url='https://github.com/rockdaboot/libpsl'
arch=(any)
license=('MIT')
depends=('mingw-w64-libidn2' 'mingw-w64-libunistring')
makedepends=('mingw-w64-configure' 'python')
source=(https://github.com/rockdaboot/libpsl/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('a5084b9df4ff2a0b1f5074b20972efe0da846473396d27b57967c7f6aa190ab3c910b4bfc4f8f03802f08decbbad5820d850c36ad59610262ae37fe77de0c7f5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  unset LDFLAGS
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-gtk-doc-html \
      --disable-man \
      --enable-{builtin,runtime}=libidn2 \
      ..
    LC_CTYPE=en_US.UTF-8 make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' -exec ${_arch}-strip -g {} \;
    if [[ $NO_EXECUTABLES ]]; then
      find "$pkgdir/usr/${_arch}" -name '*.exe' -delete
    fi
  done
}

# vim: ts=2 sw=2 et
