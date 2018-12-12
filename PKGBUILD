# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: ant32 <antreimer@gmail.com>

pkgname=mingw-w64-curl
pkgver=7.63.0
pkgrel=1
pkgdesc="An URL retrival utility and library (mingw-w64)"
arch=('any')
url="http://curl.haxx.se"
license=("MIT")
depends=('mingw-w64-crt'
         'mingw-w64-gnutls'
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
sha256sums=('9bab7ed4ecff77020a312d84cc5fb7eb02d58419d218f267477a724a17fd8dd8'
            '5d29129b312500c94c4e94cbcdee2fb54148b5788837761534aabb698484f4d4'
            '963368c3fdc16f37eef6b1f5b8afa99d7c945b7ae06cc636d3d6277e330c93fb'
            '5d6563e29e85c7fadd129308e9927450c59fe5d429d9b27aafd3460bfc40defb')

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
