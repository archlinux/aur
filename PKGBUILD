# Maintainer: krumelmonster <krumelmonster@zoho.com>

pkgname=fileshelter
pkgver=4.2.0
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
sha256sums=('dc44c5a55e194d3775b7367ecaba31252296ffe6dbcbf4067e71bbe7f2e50ed7'
            '886d3e08bd72b279f81b6ddbad2b7da00b746566aed4ea8a63baae3bdc4ccfd1'
            'bd578276480969f7c006e7ed51708a7484bd901060b83d2e7aa0b0a22f88c185')

prepare() {
  cd $pkgname-$pkgver

  # https://github.com/epoupon/fileshelter/issues/40
  sed -i '21 a #include <vector>' src/utils/Config.hpp
}

build() {
  cd $pkgname-$pkgver
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
  install -Dm640 "$pkgdir/usr/share/fileshelter/fileshelter.conf" "$pkgdir/etc/fileshelter.conf"
  install -Dm644 "$pkgdir/usr/share/fileshelter/fileshelter.service" "$pkgdir/usr/lib/systemd/system/fileshelter.service"
  rm "$pkgdir/usr/share/fileshelter/fileshelter.service"
  install -Dm644 "${srcdir}/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "${srcdir}/$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

}
