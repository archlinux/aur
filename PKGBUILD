# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=curl-http3
pkgver=8.0.1
pkgrel=1
pkgdesc="An URL retrieval utility and library - compiled with HTTP/3 support - binary is called curl3"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'brotli' 'libbrotlidec.so' 'libgssapi_krb5.so'
         'krb5' 'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so'
         'libssh2' 'libssh2.so' 'openssl' 'zlib' 'zstd' 'libzstd.so')
makedepends=('rust' 'git' 'go' 'cmake')
_quiche_ref=0.17.1
source=("https://curl.haxx.se/download/curl-$pkgver.tar.gz"{,.asc}
		"git+https://github.com/cloudflare/quiche.git#tag=${_quiche_ref}"
		"git+https://github.com/google/boringssl.git")
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

prepare() {
  cd quiche
  git submodule init
  git config submodule.boringssl.url "${srcdir}"/boringssl
  git -c protocol.file.allow=always submodule update quiche/deps/boringssl
}
build() {
  #Build quiche
  cd quiche
  CFLAGS+=' -ffat-lto-objects'
  cargo build --package quiche --release --features ffi,pkg-config-meta,qlog
  mkdir quiche/deps/boringssl/src/lib
  ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) quiche/deps/boringssl/src/lib/
  cd ..
 
  ## Build curl
  cd "curl-${pkgver}"

  autoreconf -fi
## Arch Linux build flags + BoringSSL and quiche
  ./configure \
      LDFLAGS="-Wl,-L,${PWD}/../quiche/target/release" \
      --with-openssl=$PWD/../quiche/quiche/deps/boringssl/src \
      --with-quiche=$PWD/../quiche/target/release \
      --enable-alt-svc \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --disable-manual \
      --disable-shared \
      --enable-ipv6 \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-libssh2 \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt
  make
}

package() {
  cd "curl-${pkgver}"

  make DESTDIR="$pkgdir" install
  LD_LIBRARY_PATH=$PWD/../quiche/target/release make DESTDIR="$pkgdir" install -C scripts

  cd ..
  
  # rename curl to avoid conflicts
  mv "${pkgdir}/usr/bin/curl" "${pkgdir}/usr/bin/curl3"
  mv "${pkgdir}/usr/bin/curl-config" "${pkgdir}/usr/bin/curl-config3"

  # Remove stuff that would conflict with core/curl
  rm -rf "${pkgdir}/usr/lib" "${pkgdir}/usr/share" "${pkgdir}/usr/include"
    
  # libquice is required
  install -Dm755 quiche/target/release/libquiche.so "${pkgdir}/usr/lib/libquiche.so"

  # license
  install -Dm644 "curl-${pkgver}"/COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 quiche/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-quiche"
  install -Dm644 quiche/quiche/deps/boringssl/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-boringssl"
}
sha512sums=('87d945e65176613c6296f8b130bd6c5355e3ca3c62ee4010edd481950cad9760482fd3be8a84e51501c118c29ebc284b8f87c49b06f9d248e9da5819fda38f8f'
            'SKIP'
            'SKIP'
            'SKIP')
