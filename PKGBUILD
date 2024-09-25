# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=openvas-scanner
pkgver=23.9.0
pkgrel=3
pkgdesc='Vulnerability scanning Daemon'
arch=('x86_64')
url="https://github.com/greenbone/openvas-scanner"
license=('GPL-2.0-only')
depends=('gvm-libs' 'json-glib' 'libbsd' 'libgcrypt' 'redis' 'rsync')
makedepends=('cmake' 'doxygen')
groups=('greenbone-vulnerability-manager')
install=openvas.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/openvas-scanner/archive/v${pkgver}.tar.gz"
        "greenbone-nvt-sync.timer"
        "greenbone-nvt-sync.service")
sha512sums=('820510e7ae7c738796809d010ef5d177f002cd6dfe2c36354e47e1bda8f32ecd1c4bdc1779d4ff3bdc5d9ab31fe4e8330b0142206b54132c84dfc5f8b37bd87e'
            '2df63297cd9bd1cfb7b774152b1791ff946a1a410e563e54212652d847063b3c22b5362cd287b1bd73684be1fbd66464a2f8bb79b92cd086ba58e9a801d675ec'
            '1ef913c24721533b0f779047532de63d195e8498885b90972a7bbbfb734444c0f7cbdcc52c437b2ce773881d45eadfcec03fcd00886e02962cb06d318d0c7c96')


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt
}

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBINDIR=/usr/bin \
    -DLIBDIR=/usr/lib \
    -DSYSCONFDIR=/etc \
    -DLOCALSTATEDIR=/var \
    -DOPENVAS_FEED_LOCK_PATH=/run/gvm/feed-update.lock \
    -DOPENVAS_NVT_DIR=/var/lib/openvas
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install

  install -m 755 -d $pkgdir/usr/lib/systemd/system
  install -m 644 greenbone-nvt-sync.service $pkgdir/usr/lib/systemd/system
  install -m 644 greenbone-nvt-sync.timer $pkgdir/usr/lib/systemd/system
}
