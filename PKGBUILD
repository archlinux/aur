# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=neon
pkgname=lib32-neon
pkgver=0.35.0
pkgrel=1
pkgdesc='HTTP/1.1 and WebDAV client library (32 bit)'
arch=(x86_64)
url='https://notroj.github.io/neon/'
license=(LGPL-2.0-or-later)
depends=(
    ca-certificates
    lib32-expat
    lib32-glibc
    lib32-krb5
    lib32-openssl
    lib32-zlib
    neon
)
makedepends=(
    docbook-xsl
    git
    xmlto
)
source=("git+https://github.com/notroj/neon.git#tag=$pkgver")
b2sums=(6c958af502b5aa7f6cc4c04a8a356da7eeba79edce37b3f7bf6feb4d86fb1762e91c4f12454563d0eaee72e5544322b84245e617df2fb9dd7c5cc75fcea6c7eb)
validpgpkeys=(190555472DCC589BEF01609C608A86DF9833CC49) # Joe Orton

prepare() {
    cd $_basename

    echo $pkgver > .version
    autoreconf -fi
}

build() {
    cd $_basename

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-shared \
        --with-ssl=openssl \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \

    make
    make docs compile-gmo
}

check() {
    cd $_basename

    make check
}

package() {
    cd $_basename

    make DESTDIR="$pkgdir" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
