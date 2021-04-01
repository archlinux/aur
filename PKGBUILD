# Maintainer: vkill <vkill.net@gmail.com>

pkgname=curl-quiche-http3
pkgver=7.76.0
pkgrel=1
pkgdesc="An URL retrieval utility and library - build with quiche version HTTP3"
arch=('x86_64')
url="https://curl.haxx.se"
license=('MIT')
depends=('ca-certificates' 'krb5' 'libssh2' 'libssh2.so' 'openssl' 'zlib'
         'libpsl' 'libpsl.so' 'libnghttp2' 'libidn2' 'libidn2.so' 'zstd'
         'curl')
makedepends=('git' 'rust' 'cmake')
source=("https://curl.haxx.se/download/curl-$pkgver.tar.gz"{,.asc})
sha512sums=('f074e9315739bb05fc194ef66b154912620df3ddec11c01ded8f2ecde08875006418a716919dafe5001256f912c07e5576072e1df9a683f91cd3bc8143c6f054'
            'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

# 2020-03-29
_quiche_ref="ba90a8dba514c953d6102b812096f9238ec170bb"

build() {
  #
  rm -rf quiche
  mkdir quiche
  cd quiche
  git init
  git remote add origin https://github.com/cloudflare/quiche.git
  git fetch --depth 1 origin ${_quiche_ref}
  git checkout FETCH_HEAD
  git submodule update --init --depth 1 --recursive

  sed -i -e 's/^name = "quiche"/name = "curl_quiche"/' Cargo.toml
  cargo build --release --features ffi,pkg-config-meta,qlog
  mv target/release/quiche.pc target/release/curl_quiche.pc
  sed -i -e 's/ -lquiche$/ -lcurl_quiche/' target/release/curl_quiche.pc
  mkdir deps/boringssl/src/lib
  ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) deps/boringssl/src/lib/

  cd ..

  #
  cd "curl-$pkgver"
  
  sed -i -e 's/(quiche,/(curl_quiche,/' configure.ac
  sed -i -e 's/ quiche`/ curl_quiche`/' configure.ac
  
  ./buildconf
 
  ./configure \
      LDFLAGS="-Wl,-rpath,$PWD/../quiche/target/release" --with-ssl=$PWD/../quiche/deps/boringssl/src --with-curl_quiche=$PWD/../quiche/target/release \
      --disable-shared \
      --enable-alt-svc \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --disable-manual \
      --enable-ipv6 \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-libssh2 \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd "curl-$pkgver"

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install -C scripts

  # license
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING

  #
  cd ..

  mv "${pkgdir}/usr/bin/curl" "${pkgdir}/usr/bin/${pkgname}"
  mv "${pkgdir}/usr/bin/curl-config" "${pkgdir}/usr/bin/${pkgname}-config"

  #
  rm -rf "${pkgdir}/usr/lib" "${pkgdir}/usr/share" "${pkgdir}/usr/include"

  #
  install -Dm755 quiche/target/release/libcurl_quiche.so "${pkgdir}/usr/lib/libcurl_quiche.so"
}
