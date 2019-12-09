# Maintainer: TheGoliath
# Contributor: TheGoliath
pkgname=squidguard
pkgver=1.6.0
pkgrel=6
pkgdesc="Filter and redirector plugin for Squid. SquidGuard is a free, flexible and ultra fast filter, redirector and access controller plugin for squid."
arch=('x86_64')
url="http://www.squidguard.org"
license=('GPL')
groups=('')
depends=('db' 'bison' 'flex' 'squid')
optdepends=('openldap'
            'squid>=3.4.0')
backup=('etc/logrotate.d/squidguard' 'etc/squidguard/squidGuard.conf.default')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source=("https://launchpad.net/debian/+archive/primary/+sourcefiles/squidguard/$pkgver-1/squidguard_$pkgver.orig.tar.gz")
#	"squidguard-patch.diff")
sha512sums=('d6e934f550cd777d58abda5f4fd905ccc396afc28e1ddb0bb842a9a3364cbe43db5c30834fe1ed7d93623a361dde50362a79ac2b660382c7e81b4f067f2ac65e')
#            '1e7a1bdc1000b6b944acdf1ff5a339d586ad99597e09e83807c7221f24b230281899a0dc82e5aebaf2553ee5fddc3a9d54f30707c9b29285beb8a0685001c4ab')

#prepare() {
#  cd "${srcdir}/${pkgname}-${pkgver}"
#
#  patch -p0 -i "${srcdir}/squidguard-patch.diff"
#}

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  ./autogen.sh
  sed -i '19,24 s/@[se]/$(DESTDIR)&/; /SQUIDUSER/d; 51d' Makefile.in
  ./configure \
	--prefix=/usr \
	--with-sg-config=/etc/squidGuard/squidGuard.conf \
	--with-sg-logdir=/var/log/squidGuard \
	--with-sg-dbhome=/var/lib/squidGuard/db \

  make
}

package() {
  cd "squidguard-$pkgver"
  make DESTDIR="$pkgdir" install
}
