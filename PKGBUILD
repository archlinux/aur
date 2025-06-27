# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.19.3
pkgrel=1
pkgdesc="Driver for Intel ethernet network connection"
arch=('i686' 'x86_64')
url="https://github.com/intel/ethernet-linux-igb"
license=('GPL-2.0-or-later')
depends=('linux')
makedepends=('linux-headers' 'zstd')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/intel/ethernet-linux-igb/releases/download/v$pkgver/igb-$pkgver.tar.gz")
sha256sums=('53cfe1e2d638b9bada6a93abc44d72f63e2872fcfd177ae878add045276dfb9d')


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
