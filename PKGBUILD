# Contributor: Yosef Or Boczko <yoseforb@gmail.com>

_pkgname=geoip
pkgname=$_pkgname-git
pkgver=v1.4.8.119.gea0dc0f
pkgrel=1
pkgdesc="Non-DNS IP-to-country resolver C library & utils"
arch=('i686' 'x86_64')
url="http://www.maxmind.com/app/c"
license=('GPL')
depends=('zlib' 'geoip-database')
backup=('etc/geoip/GeoIP.conf')
options=('!libtool' '!emptydirs')
source=('git://github.com/maxmind/geoip-api-c.git#branch=bz/pre-1.5.2'
        '0001-Don-t-install-GeoIP.dat.-It-does-not-exist.patch')
sha256sums=('SKIP'
            '004984ce2b015acedec03a0fd54f309fa546903994dc7a0585471ff18c2bebc1')
conflicts=('geoip')
replaces=('geoip')
provides=('geoip' 'geoip=1.5.2')

 pkgver() {
  cd "$srcdir/geoip-api-c"
  git describe --always | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/geoip-api-c"
  patch -Np1 -i "$srcdir/0001-Don-t-install-GeoIP.dat.-It-does-not-exist.patch"
}

build() {
  cd "$srcdir/geoip-api-c"
  autoreconf -vi
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc/geoip \
    --disable-data-files
  make
}

package() {
  cd "$srcdir/geoip-api-c"
  make DESTDIR="$pkgdir" install
}
