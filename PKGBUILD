# Maintainer: Anatol Pomozov

pkgname=coreboot-utils-git
pkgver=4.0.r10271.g8cce701
pkgrel=1
pkgdesc='Tools and utilities to work with Coreboot firmware'
url='http://www.coreboot.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
source=(git+https://review.coreboot.org/p/coreboot)
sha256sums=('SKIP')

pkgver() {
  cd coreboot
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd coreboot/util

  make -C cbfstool
  make -C ifdtool
  make -C nvramtool
  make -C inteltool
  make -C superiotool
  make -C cbmem
  make -C romcc romcc # tests fail
}

package() {
  cd coreboot/util
  install -m755 -d "$pkgdir/usr/bin"
  install -m755 -t "$pkgdir/usr/bin" cbfstool/{cbfstool,rmodtool} ifdtool/ifdtool nvramtool/nvramtool inteltool/inteltool superiotool/superiotool cbmem/cbmem romcc/romcc

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
