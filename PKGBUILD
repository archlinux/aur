# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.8.3
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

source=("https://www.infradead.org/~mchehab/rasdaemon/rasdaemon-${pkgver}.tar.bz2"
        buffer-overflow.patch)
sha256sums=('44ca3b02951e45411ea75a9fa5314ff4efb424ab029f196807632b905645c37b'
            '87f4e9584fdebcb80060fbfea720733b80ffd98aebdef099c62dad778e3916d1')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/buffer-overflow.patch"
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
