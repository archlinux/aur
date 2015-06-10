# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=rplay
pkgver=3.3.2
pkgrel=1
pkgdesc="Network audio system library"
arch=('x86_64' 'i686')
url="http://rplay.doit.org/"
license=('GPL')
depends=('bash')
install=rplay.install
source=("http://rplay.doit.org/dist/$pkgname-$pkgver.tar.gz"
        "http://archive.debian.org/debian/pool/main/r/rplay/rplay_3.3.2-11.1.diff.gz"
        'rplayd.service'
        'rplayd@.service'
        'rplayd.socket')
md5sums=('e39888f6bea32e1c8cf4a8880b416e56'
         '180052b0ddb28e63e5dc463e7a7fde5c'
         '471ea54447697c613c24dd9d00e0bd0f'
         'b41553f8993893ba263ba80ee17f42bc'
         'aa2208275aec7d92a874f32d9d52d4fe')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 <../rplay_3.3.2-11.1.diff
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc/rplay \
    --without-x \
    --enable-rplayd-user=nobody \
    --enable-rplayd-group=audio
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install \
    prefix="$pkgdir/usr" \
     infodir="$pkgdir/usr/share/info" \
     mandir="$pkgdir/usr/share/man"
  install -d "$pkgdir/etc/rplay"
  install -m 644 etc/rplay.{conf,helpers,hosts,servers} "$pkgdir/etc/rplay"
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m 644 ../rplayd{.service,@.service,.socket} "$pkgdir/usr/lib/systemd/system"
}


# vim:set et sw=2:
