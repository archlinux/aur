# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=unicornscan
pkgver=0.4.7
pkgrel=2
pkgnum=2
pkgdesc="Scalable, accurate, flexible and efficient network probing"
url="http://www.unicornscan.org/"
arch=('x86_64')
depends=('geoip' 'postgresql-libs' 'libdnet')
source=("http://pkgs.fedoraproject.org/repo/pkgs/$pkgname/$pkgname-$pkgver-$pkgnum.tar.bz2/4c5f272eb38c333c0094c32317edf758/$pkgname-$pkgver-$pkgnum.tar.bz2"
		"unicornscan-0.4.7-geoip.patch"
		"unicornscan-0.4.7-gcc5.patch")
sha256sums=('06c1e7f7471bcf6d34f0094b8fe4fa117dd945f91e0a0c1c2575e12465f0e2ec'
            'fe4d6403168774a487650776d33692db4ba7eb5c592bd17f51f4a9e8a8b23f4c'
            '41a435847827882db771695bf5d2d31fc0b618cc1a957cf542b2b2b4a1882460')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 -i "$srcdir/unicornscan-0.4.7-geoip.patch"
  patch -p1 -i "$srcdir/unicornscan-0.4.7-gcc5.patch"
}

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # - _GNU_SOURCE is required for "ucred" from <bits/socket.h> via <sys/socket.h>
  # - Use classical non-SELinux permission schema once SELinux Reference Policy is
  #   including unicornscan support directly, maybe with Fedora 13 and/or RHEL 6
  # - MySQL support is only available in ./configure as inside broken and disabled
  ./configure CFLAGS="-D_GNU_SOURCE" LDFLAGS="-lGeoIP" \
	  --prefix=/usr --sysconfdir=/etc --localstatedir=/var --with-pgsql
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" INSTALL="install -p" install
}
