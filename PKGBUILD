# Maintainer: Ashley Bone <aur DOT ashley DOT bone AT gmail DOT com>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.6.4
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="http://www.infradead.org/~mchehab/rasdaemon/"
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
sha256sums=('a672f7f43235019dcd015c8d20c790c37c93ca74856c6d8835d5156a4b3f205c')
# Git tree: http://git.infradead.org/users/mchehab/rasdaemon.git

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  autoreconf -fi
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
