# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-manager
pkgver=3.0.0
pkgrel=1
pkgdesc="Bus communication for all Prelude modules"
arch=('i686' 'x86_64')
url="http://www.prelude-siem.org"
license=('GPLv2')
makedepends=('gtk-doc')
# libmaxminddb-git and not libmaxminddb because libmaxminddb do not provide ".pc" file
depends=('tcp_wrappers' 'libmaxminddb-git' 'libprelude' 'libpreludedb')
source=("https://www.prelude-siem.org/pkg/src/3.0.0/$pkgname-$pkgver.tar.gz" "prelude-manager.run" "prelude-manager-conf.patch" "prelude-manager.service")
install="$pkgname.install"
backup=('etc/prelude-manager/prelude-manager.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	      --enable-gtk-doc
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/var/run"
  install -D -m 0644 "$srcdir/$pkgname.run" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

prepare() {
  patch -p0 <prelude-manager-conf.patch
}

md5sums=('cf412ea1d5768fd76f0922036445d677' '322d772d96107414152b926c5650b6b6' 'c51ab90ed0c242ae3ce752db97ac24cc' '8217d594e84867d077a007fe42cfef15')
