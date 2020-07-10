pkgname=coreboot-utils
pkgver=4.12
pkgrel=1
pkgdesc='Tools and utilities to work with coreboot firmware'
url='https://www.coreboot.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(pciutils)
optdepends=("python: me_cleaner support")
provides=(ectool)
conflicts=("coreboot-utils-git")
makedepends=()
source=("coreboot.${pkgver}.tar.gz::https://coreboot.org/releases/coreboot-${pkgver}.tar.xz")
sha256sums=('edcad000ee9b73183c396ea76155629b3d27c693e0f1ae83e3424c4d936e2be2')

build() {
  cd coreboot-${pkgver}/util

  make -C cbfstool
  make -C ifdtool
  make -C nvramtool
  make -C inteltool
  make -C intelmetool
  make -C superiotool
  make -C cbmem
  make -C ectool
  make -C intelvbttool
  if [ "$BUILD_AUTOPORT" == y ]; then
	  cd autoport
	  go build
  fi
}

package() {
  cd coreboot-${pkgver}/util
  install -m755 -d "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man8"
  install -m755 -t "$pkgdir/usr/bin" cbfstool/{cbfstool,rmodtool} ifdtool/ifdtool nvramtool/nvramtool inteltool/inteltool superiotool/superiotool cbmem/cbmem ectool/ectool intelmetool/intelmetool intelvbttool/intelvbttool
  install -m755 "me_cleaner/me_cleaner.py" "$pkgdir/usr/bin/me_cleaner"
  if [ "$BUILD_AUTOPORT" == y ]; then
	  install -m755 -t "$pkgdir/usr/bin" autoport/autoport
  fi
  install -m644 -t "$pkgdir"/usr/share/man/man8 inteltool/inteltool.8

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
