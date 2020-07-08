# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: derhomp <nick at nickz dot org>

pkgname=squidguard
pkgver=1.6.0
pkgrel=9
pkgdesc="Filter and redirector plugin for Squid. SquidGuard is a free, flexible and ultra fast filter, redirector and access controller plugin for squid."
arch=('any')
url="http://www.squidguard.org"
license=('GPL')
depends=('db' 'bison' 'flex' 'squid')
optdepends=('openldap'
            'squid>=3.4.0')
backup=('etc/squid/squidGuard.conf')
options=('!strip' 'emptydirs')
source=("https://launchpad.net/debian/+archive/primary/+sourcefiles/squidguard/$pkgver-1/squidguard_$pkgver.orig.tar.gz"
	"squidguard-1.6.0-gcc10.patch")
sha512sums=('d6e934f550cd777d58abda5f4fd905ccc396afc28e1ddb0bb842a9a3364cbe43db5c30834fe1ed7d93623a361dde50362a79ac2b660382c7e81b4f067f2ac65e'
            'c7852acd56b0282f8496619e2e01a9d0916f879641f35c618d4dc2798c60ef260c56dbf23d13b7eeb95c13aceea649001b089688183f3f9cfdebfcea3a3f5e9b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p0 -i "$srcdir/squidguard-1.6.0-gcc10.patch"

}

build() {
  cd "${srcdir}/${pkgname}-$pkgver"
  ./autogen.sh
  ./configure \
	--prefix=/usr \
	--with-sg-config=/etc/squid/squidGuard.conf \
	--with-sg-logdir=/var/log/squidGuard \
	--with-sg-dbhome=/var/lib/squidGuard/db \

  make
}

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install

  install -dm755 -o proxy -g proxy ${pkgdir}/var/log/squidGuard
  install -dm755 -o proxy -g proxy ${pkgdir}/var/lib/squidGuard
}
