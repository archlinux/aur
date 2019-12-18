# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=curl-http3
pkgver=7.67.0
pkgrel=2
pkgdesc="An URL retrieval utility and library - compiled with HTTP/3 support - binary is called curl3"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'openssl' 'zlib' 'libpsl' 'libnghttp2'
         'libidn2' 'libidn2.so')
makedepends=('rust' 'git' 'go' 'cmake')
source=("https://curl.haxx.se/download/curl-$pkgver.tar.gz"{,.asc})
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg
#source=("curl-$pkgver.zip::https://github.com/curl/curl/archive/master.zip")

_quiche_tag=0.1.0

build(){
  test -e quiche || git clone --recursive --branch ${_quiche_tag} --depth 1 https://github.com/cloudflare/quiche.git

  ## Build BoringSSL
  mkdir -p quiche/deps/boringssl/build
  cd quiche/deps/boringssl/build

  cmake -DCMAKE_POSITION_INDEPENDENT_CODE=on ..
  make

  cd .. 
  mkdir -p .openssl/lib
  cp build/crypto/libcrypto.a build/ssl/libssl.a .openssl/lib
  ln -sf ${PWD}/include .openssl
  cd ../..

  ## Build quiche
  QUICHE_BSSL_PATH=$PWD/deps/boringssl cargo build --release --features pkg-config-meta
  cd ..
 
  ## Build curl
  cd "curl-${pkgver}"
#  cd "curl-master"

  ./buildconf
## Arch Linux build flags + BoringSSL and quiche
  ./configure \
      LDFLAGS="-Wl,-rpath,${PWD}/../quiche/target/release" \
      --with-ssl=$PWD/../quiche/deps/boringssl/.openssl \
      --with-quiche=$PWD/../quiche/target/release \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --disable-manual \
      --disable-shared \
      --enable-ipv6 \
      --enable-threaded-resolver \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd "curl-${pkgver}"
#  cd "curl-master"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C scripts

  # license
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
  cd ..

  # rename curl to avoid conflicts
  mv "${pkgdir}/usr/bin/curl" "${pkgdir}/usr/bin/curl3"
  mv "${pkgdir}/usr/bin/curl-config" "${pkgdir}/usr/bin/curl-config3"

  # Remove stuff that would conflict with core/curl
  rm -rf "${pkgdir}/usr/lib" "${pkgdir}/usr/share" "${pkgdir}/usr/include"

  # libquice is requried
  install -Dm755 quiche/target/release/libquiche.so "${pkgdir}/usr/lib/libquiche.so"
}
sha512sums=(73365f964df733b5e79d690ba7260a279986a9637ba0026b37cca2eca7ba8e37967251751bdf26de730f6f432713da8b7e0a315e84f1e9dad0e0bfd3d7882f92             SKIP)
