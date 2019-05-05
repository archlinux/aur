# Maintainer: Nick Bürger <nick@nickz.org>

pkgname=squidguard
pkgver=1.5
pkgrel=2
pkgdesc="SquidGuard is a URL redirector to use blacklists with the proxysoftware Squid"
arch=('x86_64')
url="http://www.squidguard.org"
license=('GPL')
depends=('bison' 'flex' 'db' 'squid')
backup=('etc/squidguard/squidGuard.conf')
install='squidguard.install'
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/squidguard/$pkgver-5/squidguard_$pkgver.orig.tar.gz"
	"squidguard-patch.diff")
sha512sums=('d0daea2f47b08c5218125e914478f582a55b9cfa6c0da83f758c6f5ec80095684b9168d6dca0ed57e3ba88b409a8fab8b3baa48f49694f830bf2370e66e7a68d'
         '961ef70a1ca0a5f291276fbcfa9650820175cd5a4f47283062e52c1532bbac1a7d620f96737577f174e1d7ed9172902f96ab69bee0872754348804b1ad95fe6f')

prepare() {
  cd "squidGuard-$pkgver/src"

  patch -i "${srcdir}/squidguard-patch.diff"
}

build() {
  cd "squidGuard-$pkgver"
  sed -i '19,24 s/@[se]/$(DESTDIR)&/; /SQUIDUSER/d; 51d' Makefile.in
  ./configure \
	--prefix=/usr \
	--with-sg-config=/etc/squidGuard/squidGuard.conf \
	--with-sg-logdir=/var/log/squidGuard \
	--with-sg-dbhome=/var/lib/squidGuard/db \

  make
}

package() {
  cd "squidGuard-$pkgver"
  make DESTDIR="$pkgdir" install
}
