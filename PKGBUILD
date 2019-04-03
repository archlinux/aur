# Maintainer: Florian "Bluewind" Pritz <flo@xssn.at>
pkgname=spampd
pkgver=2.53
pkgrel=1
pkgdesc="Spamassassin Proxy Daemon"
arch=('any')
url="https://www.worlddesign.com/index.cfm/page/software/open-source/spampd.htm"
license=('GPL3')
depends=('perl' 'perl-net-server' 'spamassassin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mpaperno/spampd/archive/2.53.tar.gz"
        spampd.service)
md5sums=('63ef45a103687ec3a1b7983f537b4d9a'
         'afc4f2c824bfbd1cc81db3e740f29078')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  pod2man spampd.pl | gzip -n -c > spampd.8.gz
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 spampd.pl "$pkgdir/usr/bin/spampd"
  install -Dm644 spampd.8.gz "$pkgdir/usr/share/man/man8/spampd.8.gz"
  install -Dm644 "$srcdir/spampd.service" "$pkgdir/usr/lib/systemd/system/spampd.service"

  printf "u spampd - - /var/lib/spampd\n" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/spampd.conf"
  printf "d /run/spampd 0700 spampd spampd -\n" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/spampd.conf"
}

# vim:set ts=2 sw=2 et:
