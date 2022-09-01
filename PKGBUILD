# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

pkgname=mingw-w64-curl-static
pkgver=7.85.0
pkgrel=1
pkgdesc="An URL retrival utility and library (mingw-w64)"
arch=('any')
url="https://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-brotli-static'
         'mingw-w64-crt'
         'mingw-w64-libidn2'
         'mingw-w64-libpsl'
         'mingw-w64-openssl'
         'mingw-w64-zlib')
makedepends=('mingw-w64-configure')
provides=("mingw-w64-curl=$pkgver")
conflicts=('mingw-w64-curl')
options=('staticlibs' '!strip' '!buildflags')
source=("${url}/download/curl-${pkgver}.tar.bz2"
        "0002-nghttp2-static.patch"
        "0003-libpsl-static-libs.patch"
        "0004-only-build-lib.patch")
sha256sums=('21a7e83628ee96164ac2b36ff6bf99d467c7b0b621c1f7e317d8f0d96011539c'
            'e330a7c9bfa88b1347d8ffda2b278a719d658ec99eff68bfa0568e2bc32dffeb'
            '7492d019036b5bec251bfbc3c0b40e5f16d3dd6b2515068835e087a6c21f19ad'
            '2362b8415aab8eaf6cd0146f576c2cbe4ba8c32ffce20bc445db6ec59a0d5f75')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/curl-$pkgver"
  patch -Np1 -i "${srcdir}/0002-nghttp2-static.patch"
  patch -Np1 -i "${srcdir}/0003-libpsl-static-libs.patch"
  patch -N -i "${srcdir}/0004-only-build-lib.patch"
  autoreconf -vfi
}

build() {
  cd "$srcdir/curl-$pkgver"
  for _arch in ${_architectures}; do
    configure_args="--with-openssl --enable-ipv6 --with-brotli --with-libidn2 --without-ca-bundle --without-random --without-libssh2 --with-libpsl --disable-doh"
    mkdir -p build-${_arch}-static
    pushd build-${_arch}-static
    ${_arch}-configure $configure_args \
      --enable-static --disable-shared ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/curl-$pkgver/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
