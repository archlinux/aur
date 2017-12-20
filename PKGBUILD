# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=igb
pkgver=5.3.5.15
pkgrel=1
pkgdesc="Driver for Intel Ethernet Network Connection"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/e1000/files/igb%20stable/"
license=('GPL')
depends=('linux>=2.6.30')
makedepends=('linux-headers>=2.6.30')
source=("$pkgname-$pkgver-src.tar.gz::https://downloads.sourceforge.net/project/e1000/igb%20stable/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e14dff562d9c56dbea38f9d8c6dcfd9275fe10c3f2c71a09fb2bb480f47867fc')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/pci_enable_msix.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/src"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"

  _kernver=$(pacman -Q linux | grep -Po '(?<= )\d+\.\d+')
  _extramodules="/usr/lib/modules/extramodules-$_kernver-ARCH"

  find './' -name '*.ko' -exec gzip --force --fast {} \;
  install -Dm644 'igb.ko.gz' "$pkgdir/$_extramodules/igb.ko.gz"
}
