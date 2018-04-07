# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=neon
pkgname=lib32-${_pkgname}
pkgver=0.30.2
pkgrel=4
pkgdesc="HTTP and WebDAV client library with a C interface (32 bit)"
arch=('x86_64')
license=('GPL' 'LGPL')
depends=('lib32-krb5' 'lib32-expat' "${_pkgname}" 'ca-certificates' 'zlib')
url="https://web.archive.org/web/20170928175008/http://www.webdav.org/neon/"
source=("https://fossies.org/linux/www/${_pkgname}-${pkgver}.tar.gz")
options=('libtool') # FS#16067
md5sums=('e28d77bf14032d7f5046b3930704ef41')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd "${srcdir}"/${_pkgname}-${pkgver}
./configure --prefix=/usr \
  --with-expat \
  --enable-shared \
  --disable-static \
  --with-ssl=openssl \
  --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
  --libdir=/usr/lib32 --without-libproxy # without proxy, just like 'neon' package

sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
make

# fix invalid .so links in man pages (FS#24902)
sed -i '/^\.so/s|\.so \([^.]\+\)\.\([[:digit:]]\)|.so man\2/\1.\2|' doc/man/*
}

package() {
cd "${srcdir}"/${_pkgname}-${pkgver}
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
