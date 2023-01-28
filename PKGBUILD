# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=fileshelter
pkgver=5.1.1
pkgrel=1
pkgdesc="A self-hosted software to share files over the Web"
arch=('x86_64')
url="https://github.com/epoupon/fileshelter"
license=('GPL')
depends=('wt' 'libzip' 'libconfig')
makedepends=('boost')
source=("https://github.com/epoupon/fileshelter/archive/v$pkgver.tar.gz"
        "fileshelter.sysusers"
        "fileshelter.tmpfiles")
sha256sums=('f5d46566872783482b13dc78e35dd8518874ea9291a94ed0222488c638ea1160'
            '886d3e08bd72b279f81b6ddbad2b7da00b746566aed4ea8a63baae3bdc4ccfd1'
            'bd578276480969f7c006e7ed51708a7484bd901060b83d2e7aa0b0a22f88c185')

prepare() {
  cd $pkgname-$pkgver
}

build() {
  cd $pkgname-$pkgver
  mkdir build || true
  cd build
  cmake -DSYSTEM_INSTALL=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_BINDIR=bin \
        -DCMAKE_INSTALL_DATADIR=share \
        -DCMAKE_INSTALL_MANDIR=share/man \
        ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir/" install
  install -Dm640 "$pkgdir/usr/share/fileshelter/fileshelter.conf" "$pkgdir/etc/fileshelter.conf"
  install -Dm644 "$pkgdir/usr/share/fileshelter/default.service" "$pkgdir/usr/lib/systemd/system/fileshelter.service"
  rm "$pkgdir/usr/share/fileshelter/default.service"
  install -Dm644 "${srcdir}/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "${srcdir}/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

}
