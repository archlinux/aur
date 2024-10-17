# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.8.1
pkgrel=1
pkgdesc="Logging daemon for Platform Reliability, Availability and Serviceability (RAS), replacing mcelog"
arch=(i686 x86_64)
url="https://github.com/mchehab/rasdaemon"
license=(GPL2)
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
	"havememfail.patch")
sha256sums=('77aac14ba5b4c478438c497f573c8a0c11380d5a2877a75fafbc77f10c20a693'
	    '2f3bbe8b68fae8ee934ee2501f2816b6f4b32e389eb67f1505d64c460dfd1219')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/havememfail.patch"
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
    --enable-sqlite3        \
    --enable-aer            \
    --enable-non-standard   \
    --enable-arm            \
    --enable-mce            \
    --enable-extlog         \
    --enable-devlink        \
    --enable-hisi-ns-decode \
    --enable-memory-ce-pfa  \
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
