# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.8.2
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="https://github.com/mchehab/rasdaemon"
license=('GPL-2.0-or-later')
depends=(
  # For rasdaemon:
  libtraceevent
  sqlite
  # For ras-mc-ctl:
  dmidecode
  perl
  perl-dbd-sqlite
)

source=("https://www.infradead.org/~mchehab/rasdaemon/rasdaemon-${pkgver}.tar.bz2")
sha256sums=('9747d970ad1dd85d4c75e424b19f1362c2a26c814df8d406d8a3ef410f9e7de0')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr           \
    --sbindir=/usr/bin      \
    --sysconfdir=/etc       \
    --with-sysconfdefdir=/etc/sysconfig \
    --localstatedir=/var    \
    --enable-sqlite3        \
    --enable-aer            \
    --enable-non-standard   \
    --enable-arm            \
    --enable-mce            \
    --enable-extlog         \
    --enable-devlink        \
    --enable-hisi-ns-decode \
    --enable-memory-ce-pfa  \
    --enable-memory-row-ce-pfa \
    --enable-cpu-fault-isolation \
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
