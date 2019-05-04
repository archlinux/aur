# Maintainer: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libpsl
_pkgname=libpsl
pkgver=0.21.0
pkgrel=2
pkgdesc='Public Suffix List library (mingw-w64)'
url='https://github.com/rockdaboot/libpsl'
arch=(any)
license=('MIT')
depends=('mingw-w64-libidn2' 'mingw-w64-libunistring')
makedepends=('mingw-w64-configure' 'python')
source=(https://github.com/rockdaboot/libpsl/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('165c4f0b0640a813d512bd916e1532e32e43c8c81a5efd048f3a5b07b1b3c9129b4c4b5008b8b11a7c1b3914caea17564321389cd350bf1d687d53a97f2afa4d')

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
    find "$pkgdir/usr/${_arch}" -name '*.exe' -delete
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}

# vim: ts=2 sw=2 et
