# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.6.5
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="https://www.infradead.org/~mchehab/rasdaemon/"
license=(GPL2)
depends=(
  # For rasdaemon:
  sqlite
  # For ras-mc-ctl:
  dmidecode
  perl
  perl-dbd-sqlite
)
source=("https://www.infradead.org/~mchehab/rasdaemon/rasdaemon-$pkgver.tar.bz2")
sha256sums=('5a4745fd4161f2920a9e9f5eecc4f53c797e27b8a2c3c217070bb6ceaa7c1c44')
# Git tree: http://git.infradead.org/users/mchehab/rasdaemon.git

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -vfi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --localstatedir=/var    \
    --enable-aer            \
    --enable-arm            \
    --enable-extlog         \
    --enable-hisi-ns-decode \
    --enable-mce            \
    --enable-non-standard   \
    --enable-devlink        \
    --enable-diskerror      \
    --enable-abrt-report    \
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
