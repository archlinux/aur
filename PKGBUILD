# Maintainer: Anatol Pomozov <anatol dot pomozov at gmail>

pkgname=chromeos-ecutil-git
pkgver=r5106.dca7650
pkgrel=1
pkgdesc='Chromium OS Embedded Controller host tools'
url='http://dev.chromium.org/chromium-os/ec-development'
arch=(i686 x86_64)
depends=(glibc)
makedepends=(git libftdi)
license=(BSD)
source=(git+https://chromium.googlesource.com/chromiumos/platform/ec
        0001-iteflash-Initialize-variable-that-later-used-in-the-.patch)
sha1sums=('SKIP'
          'eeae4f87bb63e8edf24486cf56694c152eab44cf')

pkgver() {
  cd ec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ec
  patch -p1 < ../0001-iteflash-Initialize-variable-that-later-used-in-the-.patch
  sed 's/ccache //g' -i Makefile.toolchain
}

build() {
  cd ec
  HOST_CROSS_COMPILE= make utils
}

package() {
  cd ec/build/bds/util
  install -m755 -d $pkgdir/usr/bin
  install -m755 -t $pkgdir/usr/bin ectool
}
