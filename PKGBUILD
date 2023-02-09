# Maintainer: Ashley Bone <ashley DOT bone AT pm DOT me>
# Orginally Packaged By: Mantas Mikulėnas <grawity@gmail.com>
pkgname=rasdaemon
pkgver=0.7.0
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
source=("https://github.com/mchehab/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"nprocessors.patch")
sha256sums=('fd976b9fe4fac486009cfb3079f361d15c83572e436a233b6347f887cdab2b0c'
	    'bca975681559ed6cc7383f936b00ad370fbd803f7193685f4da9d0cbfaf6feea')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/nprocessors.patch"
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
