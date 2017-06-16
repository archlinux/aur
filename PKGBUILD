# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=curl-git
pkgver=7.54.1.29.g01811b674
pkgrel=1
pkgdesc="A URL retrieval utility and library"
arch=('i686' 'x86_64')
url="http://curl.haxx.se/"
license=('MIT')
depends=('zlib' 'libssh2' 'openssl' 'ca-certificates')
makedepends=('git')
provides=('curl=999')
conflicts=('curl')
options=('!libtool')
source=('git://github.com/curl/curl.git')
md5sums=('SKIP')

pkgver() {
  cd curl

  git describe | sed 's/curl-//; s/[_-]/./g'
}

build() {
  cd curl

  ./buildconf
  ./configure \
      --prefix=/usr \
      --mandir=/usr/share/man \
      --disable-ldap \
      --disable-ldaps \
      --enable-ipv6 \
      --enable-manual \
      --enable-versioned-symbols \
      --enable-threaded-resolver \
      --with-gssapi \
      --with-random=/dev/urandom \
      --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

package() {
  cd curl

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
