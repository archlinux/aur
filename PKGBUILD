# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=0.8.8_h
pkgrel=1
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('libmariadbclient' 'net-snmp' "cacti=${pkgver}")
makedepends=('help2man')
options=('!makeflags')
backup=('etc/spine.conf')
source=( "http://www.cacti.net/downloads/spine/${pkgname}-${pkgver/_/}.tar.gz")
md5sums=('935e2bc12ba6a4d2d9dc05c959291e69')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"

  /usr/bin/aclocal
  /usr/bin/libtoolize --force --copy
  /usr/bin/autoheader
  /usr/bin/autoconf
  /usr/bin/automake --add-missing --copy --force-missing
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"
  export CFLAGS="$CFLAGS -lpthread -lm"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/etc/spine.conf.dist "${pkgdir}"/etc/spine.conf
}

