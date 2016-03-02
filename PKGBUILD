# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=0.8.8_g
pkgrel=1
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('libmariadbclient' 'net-snmp' "cacti=${pkgver}")
makedepends=('help2man')
options=('!makeflags')
backup=('etc/spine.conf')
source=("make.patch"
        "http://www.cacti.net/downloads/spine/${pkgname}-${pkgver/_/}.tar.gz")
md5sums=('13792e3230078424763fe86ea822d5a0'
         '9e90936b950a7a353b31bf16ff7798f4')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"

  patch -p1 -i ../make.patch

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

