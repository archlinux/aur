# Maintainer: Anatol Pomozov
# Maintainer: Iru Cai <mytbk920423@gmail.com>

pkgname=coreboot-utils-git
pkgver=4.4.r1339.gdbf3067
pkgrel=1
pkgdesc='Tools and utilities to work with Coreboot firmware'
url='http://www.coreboot.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git)
source=(git+https://review.coreboot.org/coreboot
        # vboot provides vb2_api.h needed by cbfstool
        git+https://review.coreboot.org/vboot)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd coreboot
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd coreboot

  git submodule init
  git config -f .gitmodules 'submodule.vboot.url' "$srcdir/vboot"
  git submodule sync -- 3rdparty/vboot
  git submodule update -- 3rdparty/vboot
}

build() {
  cd coreboot/util

  make -C cbfstool
  make -C ifdtool
  make -C nvramtool
  make -C inteltool
  make -C intelmetool
  make -C superiotool
  make -C cbmem
  make -C romcc romcc # tests fail
  make -C ectool
}

package() {
  cd coreboot/util
  install -m755 -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
  install -m755 -t "$pkgdir/usr/bin" cbfstool/{cbfstool,rmodtool} ifdtool/ifdtool nvramtool/nvramtool inteltool/inteltool superiotool/superiotool cbmem/cbmem romcc/romcc ectool/ectool intelmetool/intelmetool
  install -m644 -t "$pkgdir"/usr/share/man/man8 inteltool/inteltool.8

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
