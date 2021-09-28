# Maintainer: Hendrik 'T4cC0re' Meyer <aur@t4cc0.re>
pkgname=curl-http3
pkgver=7.79.1
pkgrel=1
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

_quiche_ref=0.10.0

build(){
  rm -rf quiche
  ## Build quiche
  mkdir quiche
  cd quiche
  git init
  git remote add origin https://github.com/cloudflare/quiche.git
  git fetch --depth 1 origin ${_quiche_ref}
  git checkout FETCH_HEAD
  git submodule update --init --recursive

  cargo build --release --features ffi,pkg-config-meta,qlog
  mkdir deps/boringssl/src/lib
  ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) deps/boringssl/src/lib/
  cd ..
 
  ## Build curl
  cd "curl-${pkgver}"

  ./buildconf
## Arch Linux build flags + BoringSSL and quiche
  ./configure \
      LDFLAGS="-Wl,-rpath,${PWD}/../quiche/target/release" \
      --with-ssl=$PWD/../quiche/deps/boringssl/src \
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
sha512sums=(0f9546285bef741f69d25f20bcd5b961d29fc88084d9f3ebe0c66a6674f4c69a531b41f8e3cc57474f528abdd90aa7981e653c339c5e8383353c36a82efaafc4             SKIP)
