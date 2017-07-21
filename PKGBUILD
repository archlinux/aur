# Maintainer: Sampson Crowley <sampsonsprojects at gmail dot com>
#Contributors:
# Trương Xuân Tính <xuantinh@gmail.com>
# henning mueller <henning@orgizm.net>
# Jerome Rose <jrose dot pub at gmail dot com>

pkgname=pgpool-ii
_pkgname=pgpool-II
pkgver=3.6.4
pkgrel=2
pkgdesc="Middleware that works between PostgreSQL servers and a PostgreSQL database client."
arch=()
url="http://www.pgpool.net"
arch=(i686 x86_64)
license=(custom)
depends=(openssl postgresql-libs)
options=(!libtool)
replaces=(pgpool)
backup=(etc/conf.d/$pkgname)
source=(
  http://www.pgpool.net/download.php?f=$_pkgname-$pkgver.tar.gz
  $pkgname.{service,conf.d,diff}  
)

prepare(){
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 -i "$srcdir/$pkgname.diff"
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/pgpool \
    --mandir=/usr/share/man \
    --with-openssl=openssl
  make
}

package() {
  install -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -D $srcdir/$pkgname.conf.d $pkgdir/etc/conf.d/$pkgname

  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/{run/pgpool,usr/share/doc}

  install -D COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp -r doc $pkgdir/usr/share/doc/$pkgname

  mv $pkgdir/usr/share/$_pkgname $pkgdir/usr/share/$pkgname
  cd $srcdir/$_pkgname-$pkgver/src/sql/pgpool-recovery
  sudo make && sudo make install
}

md5sums=('e31eedc9cf00b0b27596449a20f4c83d'
         '6f1996c211e6f512289565e162752b04'
         '74e1450ec40a5915341d7901736aca45'
         'b11938850095c777c80238ed878e158d')

