#Contributors:
# Trương Xuân Tính <xuantinh@gmail.com>
# henning mueller <henning@orgizm.net>
# Jerome Rose <jrose dot pub at gmail dot com>

pkgname=pgpool-ii
_pkgname=pgpool-II
pkgver=3.2.5
pkgrel=1
pkgdesc='pgpool-II is a connection pool server for PostgreSQL.'
arch=(i686 x86_64)
url='http://www.pgpool.net'
license=(custom)
depends=(postgresql-libs)
options=(!libtool)
replaces=(pgpool)
backup=(etc/conf.d/$pkgname)
source=(
  http://www.pgpool.net/download.php?f=$_pkgname-$pkgver.tar.gz
  $pkgname.{service,conf.d}
)

build() {
  cd $srcdir/$_pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/pgpool \
    --mandir=/usr/share/man
  make
}

package() {
  install -D $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -D $srcdir/$pkgname.conf.d $pkgdir/etc/conf.d/$pkgname

  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=$pkgdir install

  mkdir -p $pkgdir/{var/run/pgpool,usr/share/doc}

  install -D COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp -r doc $pkgdir/usr/share/doc/$pkgname

  mv $pkgdir/usr/share/$_pkgname $pkgdir/usr/share/$pkgname
  cp sample/* $pkgdir/usr/share/$pkgname
}

sha256sums=('aecac952fd3d292584c9aa359d72f89b144c29f45c9f848cb030e46215a814f7'
            '6c797a94c1648890a613e201c2ce2e3e2b602103daecc009ebf189578e8e15a0'
            '9d0c12d735595424fad799499d50bc4da8b7f1e7ffc2c21317f8824559bb7aea')
