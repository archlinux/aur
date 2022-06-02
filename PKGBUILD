# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.6.8
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="https://github.com/mchehab/rasdaemon"
license=(GPL2)
depends=(
  # For rasdaemon:
  sqlite
  # For ras-mc-ctl:
  dmidecode
  perl
  perl-dbd-sqlite
)
source=("https://github.com/mchehab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7c9ad61a13ca230e376db4014ae3192992eff10908adf38fad1917609f7d341')

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
    --with-sysconfdefdir=/etc/sysconfig \
    --localstatedir=/var    \
    --enable-aer            \
    --enable-arm            \
    --enable-extlog         \
    --enable-hisi-ns-decode \
    --enable-mce            \
    --enable-memory-ce-pfa  \
    --enable-non-standard   \
    --enable-devlink        \
    --enable-diskerror      \
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
