# Maintainer: vkill <vkill.net@gmail.com>

pkgname=curl-quiche-http3
pkgver=7.76.1
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
sha512sums=('43edacadbb823eb43008dd7d3b3851097cc40bc06ed6c701d7af2605a461ec556a9a15d1d71a8703cb2e0180aa3183995a67a072f4043ecc3a3972f25619722b'
            'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg

# 2020-04-15 0.8.1
_quiche_ref="4236ad60162058b4f182dfadca047d8be0477377"

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
      LDFLAGS="-Wl,-rpath,$PWD/../quiche/target/release" --with-openssl=$PWD/../quiche/deps/boringssl/src --with-curl_quiche=$PWD/../quiche/target/release \
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
