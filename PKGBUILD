# Maintainer: Florian "Bluewind" Pritz <flo@xssn.at>
pkgname=spampd
pkgver=2.30
pkgrel=14
pkgdesc="Spamassassin Proxy Daemon"
arch=('any')
url="https://www.worlddesign.com/index.cfm/page/software/open-source/spampd.htm"
license=('GPL')
depends=('perl' 'perl-net-server' 'spamassassin')
source=("https://www.worlddesign.com/Content/rd/mta/$pkgname/$pkgname-$pkgver.tar.gz"
        spampd.service perl-5.18-fixes.patch)
md5sums=('742c6f2cb75db54e59d044a8ee40445f'
         'afc4f2c824bfbd1cc81db3e740f29078'
         '55ea1067be9e70c60b708d355b085a0a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 -i "$srcdir/perl-5.18-fixes.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 spampd "$pkgdir/usr/bin/spampd"
  install -Dm644 spampd.8.gz "$pkgdir/usr/share/man/man8/spampd.8.gz"
  install -Dm644 "$srcdir/spampd.service" "$pkgdir/usr/lib/systemd/system/spampd.service"

  printf "u spampd - - /var/lib/spampd\n" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/spampd.conf"
  printf "d /run/spampd 0700 spampd spampd -\n" | install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/spampd.conf"
}

# vim:set ts=2 sw=2 et:
