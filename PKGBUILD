# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-git"
pkgver=latest
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod')
makedepends=('linux' 'linux-headers' 'git')
install="$pkgname.install"

# firmware.bin needs to be extracted from OS X manually.
source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git"
        "firmware.bin::https://github.com/patjak/bcwc_pcie/wiki/Get-Started")
md5sums=('SKIP'
         '4e1d11e205e5c55d128efa0029b268fe')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make

  gzip -f "facetimehd.ko"
}

package() {
  cd "$srcdir/$pkgname"

  # TODO: Get kernel name trimming from uname -r
  install -Dm 644 facetimehd.ko.gz "$pkgdir/usr/lib/modules/extramodules-4.3-ARCH/facetimehd.ko.gz"
  install -Dm 644 "$srcdir"/firmware.bin "$pkgdir/usr/lib/firmware/facetimehd/firmware.bin"
}
