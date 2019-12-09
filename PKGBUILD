# Maintainer: TheGoliath
# Contributor: TheGoliath
pkgname=squidguard
pkgver=1.6.0
pkgrel=4
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
sha512sums=('d6e934f550cd777d58abda5f4fd905ccc396afc28e1ddb0bb842a9a3364cbe43db5c30834fe1ed7d93623a361dde50362a79ac2b660382c7e81b4f067f2ac65e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -i "${srcdir}/squidguard-patch.diff"
}

build() {
  cd "squidguard-$pkgver"
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
