# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
# Disclaimer: I have no idea if this works, I only packaged it.
pkgname=rasdaemon
pkgver=0.5.9
pkgrel=2
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="http://www.infradead.org/~mchehab/rasdaemon/"
license=(GPL2)
source=("https://casper.infradead.org/~mchehab/rasdaemon/rasdaemon-$pkgver.tar.bz2")
sha256sums=('ef7045b3ce6f9deb593d9e93be42b37672806c399332769d665a63e99dfbc29c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc         \
    --enable-aer              \
    --enable-mce              \
    --enable-extlog           \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  for unit in {rasdaemon,ras-mc-ctl}.service; do
    install -D -m 644 misc/$unit "$pkgdir"/usr/lib/systemd/system/$unit
  done
}

# vim: ts=2:sw=2:et:ft=sh
