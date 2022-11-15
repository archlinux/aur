# Maintainer: Florian "Bluewind" Pritz <flo@xssn.at>
pkgname=spampd
pkgver=2.61
pkgrel=1
pkgdesc="Spamassassin Proxy Daemon"
arch=('any')
url="https://www.worlddesign.com/index.cfm/page/software/open-source/spampd.htm"
license=('GPL3')
depends=('perl' 'perl-net-server' 'spamassassin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mpaperno/spampd/archive/$pkgver.tar.gz"
        spampd.service)
sha256sums=('91e60f10745ea4f9c27b9e57619a1bf246ab9a88ea1b88c4f39f8af607e2dbae'
            '2bd1612761b07e6a613331b6448d4e0609c69aaf451707ddba1e1d9e1c0a35b6')

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
