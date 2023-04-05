# Maintainer: soh@AUR
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

## GPG key: https://daniel.haxx.se/mykey.asc

pkgname=curl-quiche-git
pkgver=8.0.1.r104.g98fac31b0
pkgrel=1
pkgdesc="An URL retrieval utility and library with QUIC(quiche)/HTTP3 support"
arch=('x86_64')
url="https://github.com/curl/curl"
license=('MIT')
depends=(
        'ca-certificates' 'brotli' 'libbrotlidec.so' 'libgssapi_krb5.so'
        'krb5' 'libidn2' 'libidn2.so' 'libnghttp2' 'libpsl' 'libpsl.so'
        'libssh2' 'libssh2.so' 'openssl' 'zlib' 'zstd' 'libzstd.so')
makedepends=('git' 'cmake')
provides=('libcurl.so' "curl=${pkgver%.r*}")
conflicts=('curl')
source=("$pkgname::git+$url?signed")
sha256sums=('SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') ## Daniel Stenburg

pkgver() {
    git -C "$pkgname" describe --long --tags | sed 's/^curl-//;s/_/./g;s/-/.r/;s/-/./'
}
prepare() {
    cd "${srcdir}"
    if [ ! -d quiche ] ; then
        git clone --recursive https://github.com/cloudflare/quiche
    else
        cd quiche
        git pull
    fi
    

}
build() {
    cd quiche
    cargo build --package quiche --release --features ffi,pkg-config-meta,qlog
    mkdir -p quiche/deps/boringssl/src/lib
    ln -vnf $(find target/release -name libcrypto.a -o -name libssl.a) quiche/deps/boringssl/src/lib/
    cd ..
    cd "$pkgname"

    autoreconf -fi
    ./configure LDFLAGS="-Wl,-rpath,$PWD/../quiche/target/release" --with-openssl=$PWD/../quiche/quiche/deps/boringssl/src --with-quiche=$PWD/../quiche/target/release \
                    --prefix=/usr \
                    --mandir=/usr/share/man \
                    --disable-ldap \
                    --disable-ldaps \
                    --disable-manual \
                    --enable-ipv6 \
                    --enable-threaded-resolver \
                    --with-gssapi \
                    --with-libssh2 \
                    --with-random=/dev/urandom \
                    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
                        --with-openssl \
                    --enable-versioned-symbols

    make
}

package() {
   cd "$pkgname"

   make DESTDIR="$pkgdir" install
   make DESTDIR="$pkgdir" install -C scripts

   install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   install -Dm755 ../quiche/target/release/libquiche.so "${pkgdir}/usr/lib/libquiche.so"

}

