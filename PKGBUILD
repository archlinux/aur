# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ant32 <antreimer at gmail dot com>

pkgname=mingw-w64-curl
pkgver=8.1.0
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
source=("${url}/download/curl-${pkgver}.tar.bz2"
        "0002-nghttp2-static.patch"
        "0003-libpsl-static-libs.patch"
	"0004-more-static-fixes.patch")
sha256sums=('8439f39f0f5dd41f399cf60f3f6f5c3e47a4a41c96f99d991b77cecb921c553b'
            '3ee9c75a3046f86f91290c143170179230c9adc6eabfbb79eb26f708a165b719'
            '7492d019036b5bec251bfbc3c0b40e5f16d3dd6b2515068835e087a6c21f19ad'
            '590eb65e90e756eaad993d52a101f29091ada2c742c5a607684e88fc5c560d54')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  patch -Np1 -i "${srcdir}/0002-nghttp2-static.patch"
  patch -Np1 -i "${srcdir}/0003-libpsl-static-libs.patch"
  patch -Np1 -i "${srcdir}/0004-more-static-fixes.patch"
  autoreconf -vfi
}

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
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
