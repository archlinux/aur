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
source=("http://www.squidguard.org/Downloads/Devel/squidGuard-$pkgver-beta.tar.gz"
	"squidguard-patch.diff")
md5sums=('85216992d14acb29d6f345608f21f268'
         'c3834cd2180ac8b919f9fb36327bf43c')

prepare() {
  cd "squidGuard-$pkgver-beta/src"

  patch -i "${srcdir}/squidguard-patch.diff"
}

build() {
  cd "squidGuard-$pkgver-beta"
  sed -i '19,24 s/@[se]/$(DESTDIR)&/; /SQUIDUSER/d; 51d' Makefile.in
  ./configure \
	--prefix=/usr \
	--with-sg-config=/etc/squidGuard/squidGuard.conf \
	--with-sg-logdir=/var/log/squidGuard \
	--with-sg-dbhome=/var/lib/squidGuard/db \

  make
}

package() {
  cd "squidGuard-$pkgver-beta"
  make DESTDIR="$pkgdir" install
}
