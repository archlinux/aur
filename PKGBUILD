# Maintainer: Kevin MacMartin <prurigro@gmail.com>

pkgname=ircd-ratbox
pkgver=3.0.10
pkgrel=3
pkgdesc='An advanced, stable and fast ircd'
url='http://www.ratbox.org'
license=('GPL')
depends=('openssl' 'sqlite' 'libtool')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
backup=("etc/$pkgname/ircd.motd")
install=$pkgname.install

source=(
  "http://www.ratbox.org/download/$pkgname-$pkgver.tar.bz2"
  "$pkgname.service"
  "$pkgname.conf"
)
sha512sums=(
  'c9a3980f0d5c0bf7ff3f3da90bfeba21b4436f5e026b4d6d3875b8e1f42e0ba40418908a39f43f1cfba7f563c4aa3853d965678a8afb61aa1b56298e3d85f710'
  '80f5f9f524b991779b0195640ce90c95f4b984d32242e68edf5313875932e21e221cf0e716fd2a69181786fa720155cd7a1e419b7a20f12125a1a787240bb557'
  '31e3719eb994e269c6ff3f3cc437674b72c8f621004feb8557c7d62bfad7d1d6def5ae56413c3eda4f7f51ed50a4c54910c5c64fd7da96b091733ecd3db0bde8'
)

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr/share/$pkgname \
    --with-confdir=/etc/$pkgname \
    --with-logdir=/var/log/$pkgname \
    --bindir=/usr/bin

  make
  cd contrib
  make
}

package() {
  install -d "$pkgdir/etc/$pkgname"
  install -Dm644 $pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 $pkgname.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -d "$pkgdir/usr/share/$pkgname/modules/contrib/"
  cp contrib/.libs/*.so "$pkgdir/usr/share/$pkgname/modules/contrib/"
}
