# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_basename=neon
pkgname=lib32-neon
pkgver=0.30.2
pkgrel=5
pkgdesc="HTTP and WebDAV client library with a C interface (32 bit)"
arch=(x86_64)
url="https://web.archive.org/web/20170928175008/http://www.webdav.org/neon/"
license=(GPL LGPL)
depends=(lib32-krb5 lib32-expat ca-certificates neon)
source=("https://fossies.org/linux/www/${_basename}-${pkgver}.tar.gz")
options=('libtool') # FS#16067
source=(https://fossies.org/linux/www/${_basename}-${pkgver}.tar.gz
        $_basename-$pkgver.tar.gz.asc)
sha1sums=('d1c020f96731135263476ebaa72b2da07c4727cd'
          'SKIP')
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
        --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    cd "${_basename}-${pkgver}"

    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}/usr"/{bin,include,share}
}
