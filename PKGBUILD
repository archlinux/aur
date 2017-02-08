# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-curl
pkgver=7.52.1
pkgrel=3
pkgdesc="An URL retrival utility and library (mingw-w64)"
arch=('any')
url="http://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-crt'
         'mingw-w64-gnutls'
         'mingw-w64-libidn2'
         'mingw-w64-libssh2'
         'mingw-w64-openssl'
         'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("$url/download/curl-$pkgver.tar.bz2")
md5sums=('dd014df06ff1d12e173de86873f9f77a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in ${_architectures}; do
    configure_args="--with-ssl --enable-ipv6 --with-libidn2 --with-libssh2 --without-ca-bundle --without-random"
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
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
