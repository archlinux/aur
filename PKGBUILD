# Maintainer: Thomas Andrejak <thomas.andrejak@gmail.com>

pkgname=prelude-manager
pkgver=5.0.0
pkgrel=1
pkgdesc="Bus communication for all Prelude modules"
arch=('i686' 'x86_64')
url="https://www.prelude-siem.org"
license=('GPLv2')
makedepends=('gtk-doc')
# libmaxminddb-git and not libmaxminddb because libmaxminddb do not provide ".pc" file
depends=('tcp_wrappers' 'libmaxminddb-git' 'libprelude' 'libpreludedb')
source=("https://www.prelude-siem.org/pkg/src/5.0.0/$pkgname-$pkgver.tar.gz"
        "prelude-manager.run"
	"prelude-manager.service")
install="$pkgname.install"
backup=('etc/prelude-manager/prelude-manager.conf')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  CPP="cpp -P" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/var/run"
  install -D -m 0644 "$srcdir/$pkgname.run" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -D -m 0644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

md5sums=('30bff3864e56bfd203eb27e7883f9bbe' '8e2009544ddf286eab60e6b322d89c1e' 'c93f36811d69bbd35fcbb7af580dc5f2')
