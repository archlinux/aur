# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Disclaimer: I have no idea if this works, I only packaged it.
pkgname=rasdaemon
pkgver=0.6.0
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="http://www.infradead.org/~mchehab/rasdaemon/"
license=(GPL2)
depends=(dmidecode sqlite)
source=("https://www.infradead.org/~mchehab/rasdaemon/rasdaemon-$pkgver.tar.bz2")
sha256sums=('b435ae16be8e1c50b2e57d4d9917f3ea92041ac6ffb5f8c015a8989303e78ca9')
# Git tree: http://git.infradead.org/users/mchehab/rasdaemon.git

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
  sed -i '/^Exec/ s/ -r//' misc/rasdaemon.service.in
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --enable-aer            \
    --enable-arm            \
    --enable-extlog         \
    --enable-hisi-ns-decode \
    --enable-mce            \
    --enable-non-standard   \
    --enable-sqlite3        \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  for unit in {rasdaemon,ras-mc-ctl}.service; do
    install -D -m 644 misc/$unit "$pkgdir"/usr/lib/systemd/system/$unit
  done
  rm -rf "$pkgdir"/usr/include
}

# vim: ts=2:sw=2:et:ft=sh
