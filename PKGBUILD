# Maintainer: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libpsl
_pkgname=libpsl
pkgver=0.20.2
pkgrel=3
pkgdesc='Public Suffix List library (mingw-w64)'
url='https://github.com/rockdaboot/libpsl'
arch=(any)
license=('MIT')
depends=('mingw-w64-libidn2' 'mingw-w64-libunistring' 'mingw-w64-gcc')
makedepends=('mingw-w64-configure' 'python')
source=(https://github.com/rockdaboot/libpsl/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('fa9f6f7f0447d9fe00f5dfca5262c56ff26217eea44d0f7fc1e5d982224c41874e753f0aa06dd9e5d7d03d4f04e3dacd4f36034cc8dd0fc6e2c28b49a23e62fe')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  unset LDFLAGS
  export LIBS+=" -lws2_32"
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
