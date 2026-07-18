# Maintainer: Maks Verver <maks@verver.ch>
# Contributor: drakkan <nicola.murino at gmail dot com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

pkgname=mingw-w64-curl
pkgver=8.21.0
pkgrel=1
pkgdesc="An URL retrival utility and library (mingw-w64)"
arch=('any')
url="https://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-crt'
         'mingw-w64-libidn2'
         'mingw-w64-libpsl'
         'mingw-w64-libssh2'
         'mingw-w64-openssl'
         'mingw-w64-libnghttp2'
         'mingw-w64-zstd'
         'mingw-w64-brotli'
         'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=(
  "${url}/download/curl-${pkgver}.tar.xz"
  'nghttp2-static.patch'
)
sha256sums=(
  'aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6'
  '9c49a8e082394114c49694bf86da118dcd1860791f3cfe23a8e3ac19bf4660bb'
)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  patch -Np1 -i "${srcdir}/nghttp2-static.patch"
  autoreconf -vfi
}

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  export CHOST=$(./config.guess)
  for _arch in ${_architectures}; do
    configure_args="--with-openssl --enable-ipv6 --with-libidn2 --with-libssh2 --without-ca-bundle --without-random --with-libpsl --with-brotli --with-zstd"
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-configure $configure_args \
      --enable-static --disable-shared ..
    make
    popd
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure $configure_args \
      --disable-static --enable-shared ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    cd "${srcdir}/${pkgname#mingw-w64-}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    #rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
