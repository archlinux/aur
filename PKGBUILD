# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-curl
pkgver=7.64.1
pkgrel=2
pkgdesc="An URL retrival utility and library (mingw-w64)"
arch=('any')
url="http://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-crt'
         'mingw-w64-libidn2'
         'mingw-w64-libpsl'
         'mingw-w64-libssh2'
         'mingw-w64-openssl'
         'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("$url/download/curl-$pkgver.tar.bz2"
        "0001-Make-cURL-relocatable.patch"
        "0002-nghttp2-static.patch"
        "0003-libpsl-static-libs.patch")
sha256sums=('4cc7c738b35250d0680f29e93e0820c4cb40035f43514ea3ec8d60322d41a45d'
            '71869fb44e83338cdd4dea8a877fa0ba80c1cccefcb9e4330f106a9d9b598f7f'
            '3b104e21ce17e75553aa82fde94ce33de71b0e92f93bc2d39b90c76062418d01'
            '7492d019036b5bec251bfbc3c0b40e5f16d3dd6b2515068835e087a6c21f19ad')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}

  rm -f lib/pathtools.h lib/pathtools.c > /dev/null 2>&1 || true
  patch -Np1 -i "${srcdir}/0001-Make-cURL-relocatable.patch"
  patch -Np1 -i "${srcdir}/0002-nghttp2-static.patch"
  patch -Np1 -i "${srcdir}/0003-libpsl-static-libs.patch"
  autoreconf -vfi
}

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in ${_architectures}; do
    configure_args="--with-ssl --enable-ipv6 --with-libidn2 --with-libssh2 --without-ca-bundle --without-random --with-libpsl"
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
