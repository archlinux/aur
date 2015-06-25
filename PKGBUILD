# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=core
pkgver=4.8
pkgrel=1
pkgdesc="Common Open Research Emulator"
arch=('i686' 'x86_64')
url="http://cs.itd.nrl.navy.mil/work/core/"
license=('BSD')
depends=('libev' 'ebtables' 'iproute2' 'python2' 'bridge-utils' 'tkimg'
         'xterm')
makedepends=('dia' 'help2man' 'imagemagick')
conflicts=('core-svn')
backup=('etc/core/core.conf' 'etc/core/perflogserver.conf')
source=("http://downloads.pf.itd.nrl.navy.mil/core/source/$pkgname-$pkgver.tar.gz"
        'core-daemon.service'
        'python2.patch')
md5sums=('20b3f10d0093af22c40423984e21aeee'
         '256e39a074f36f7f1683e88324682c9e'
         'd80b160009135529e96986538b0d10a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../python2.patch

  ./configure CPPFLAGS=-Wno-strict-aliasing PYTHON=/usr/bin/python2 --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  rm "$pkgdir/etc/init.d/core-daemon"
  rmdir "$pkgdir/etc/init.d"

  install -D "$srcdir/core-daemon.service" "$pkgdir/usr/lib/systemd/system/core-daemon.service"

  mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin/"
  rmdir "$pkgdir/usr/sbin"
}

# vim:set ts=2 sw=2 et:
