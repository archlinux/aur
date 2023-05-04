# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=neon
pkgname=lib32-neon
pkgver=0.32.5
pkgrel=1
pkgdesc="HTTP and WebDAV client library with a C interface (32 bit)"
arch=('x86_64')
url="https://notroj.github.io/neon"
license=('GPL' 'LGPL')
depends=('lib32-krb5' 'lib32-expat' 'lib32-zlib' 'ca-certificates' 'neon')
makedepends=('xmlto' 'docbook-xsl')
options=('libtool') # FS#16067
source=(https://notroj.github.io/neon/${_basename}-${pkgver}.tar.gz)
sha512sums=('97a067fcea6156e2d5cf981e8d8fc9b0a709b8175bc8061a1f254bff7b11a27fdafc5e8425665523e917133084ea3a11e11de7c1210a8d2eb3f6b1cca26ea844')
validpgpkeys=('190555472DCC589BEF01609C608A86DF9833CC49') # Joe Orton

build() {
    cd "${_basename}-${pkgver}"

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32 \
        --with-expat \
        --enable-shared \
        --disable-static \
        --with-ssl=openssl \
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
        --without-libproxy

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${_basename}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
