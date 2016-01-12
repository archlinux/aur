# Maintainer: Anatol Pomozov

pkgname=coreboot-utils-git
pkgver=4.2.r707.gee352cd
pkgrel=1
pkgdesc='Tools and utilities to work with Coreboot firmware'
url='http://www.coreboot.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
source=(git+https://review.coreboot.org/coreboot
        git+https://review.coreboot.org/vboot
        git+https://review.coreboot.org/blobs
        git+https://review.coreboot.org/nvidia-cbootimage
        git+https://review.coreboot.org/arm-trusted-firmware)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd coreboot
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd coreboot

  git submodule init
  git config -f .gitmodules 'submodule.3rdparty.url' "$srcdir/blobs"
  git config -f .gitmodules 'submodule.util/nvidia-cbootimage.url' "$srcdir/nvidia-cbootimage"
  git config -f .gitmodules 'submodule.vboot.url' "$srcdir/vboot"
  git config -f .gitmodules 'submodule.arm-trusted-firmware.url' "$srcdir/arm-trusted-firmware"
  git submodule sync
  git submodule update
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
