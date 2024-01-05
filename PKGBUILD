# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=openvas-scanner
pkgver=22.7.9
pkgrel=1
pkgdesc='Vulnerability scanning Daemon'
arch=('x86_64')
url="https://github.com/greenbone/openvas-scanner"
license=('GPL')
depends=('gvm-libs' 'json-glib' 'libbsd' 'redis' 'rsync')
makedepends=('cmake' 'doxygen')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/openvas-scanner/archive/v${pkgver}.tar.gz"
        "greenbone-nvt-sync.timer"
        "greenbone-nvt-sync.service")
sha512sums=('279a781fe698496fb88efd28c0ee6ede66a0180237b60c4d7b083fe10c7b7ac054ec04b08c9b33e6dd142f60529faedfef4441421cc04e95eaa08865e47b58dd'
            '2df63297cd9bd1cfb7b774152b1791ff946a1a410e563e54212652d847063b3c22b5362cd287b1bd73684be1fbd66464a2f8bb79b92cd086ba58e9a801d675ec'
            '1ef913c24721533b0f779047532de63d195e8498885b90972a7bbbfb734444c0f7cbdcc52c437b2ce773881d45eadfcec03fcd00886e02962cb06d318d0c7c96')

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var -DLIBDIR=/usr/lib \
    -DOPENVAS_FEED_LOCK_PATH=/run/gvm/feed-update.lock -DOPENVAS_NVT_DIR=/var/lib/openvas --debug-output .
}

package() {
  install=openvas.install
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install

  install -m 755 -d $pkgdir/usr/lib/systemd/system
  install -m 644 ${srcdir}/greenbone-nvt-sync.service $pkgdir/usr/lib/systemd/system
  install -m 644 ${srcdir}/greenbone-nvt-sync.timer $pkgdir/usr/lib/systemd/system
}
