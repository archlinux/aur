# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.17.5
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://github.com/intel/ethernet-linux-igb"
license=('GPL-2.0-or-later')
depends=('linux')
makedepends=('linux-headers' 'zstd')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/intel/ethernet-linux-igb/releases/download/v$pkgver/igb-$pkgver.tar.gz")
sha256sums=('56d5f2664c8aa62ade05c245acf555a8732c80e3754acb0b9be7b21a36535c2c')


build() {
  cd "$pkgname-$pkgver"

  EXTRA_CFLAGS="$EXTRA_CFLAGS -Wno-incompatible-pointer-types" \
  make -C "src"
}

package() {
  cd "$pkgname-$pkgver"

  _kernver="$(< /usr/src/linux/version)"

  find 'src/' -name '*.ko' -exec zstd -f {} \;
  install -Dm644 "src/igb.ko.zst" -t "$pkgdir/usr/lib/modules/$_kernver/updates"
}
