# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-git"
pkgver=latest
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod' 'bcwc-pcie-firmware')
makedepends=('linux-headers' 'git')
install="$pkgname.install"

source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git"
        "bcwc-pcie.modprobe.conf"
        "bcwc-pcie.modules-load.conf")
md5sums=('SKIP'
         '7531f220d5c3dd0ab5c31c445d526d7f'
         'd8dc0e4e125b7887b226bda0c28f30be')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make

  gzip -9f "facetimehd.ko"
}

package() {
  cd "$srcdir/$pkgname"

  EXTRA_MODULES=$(readlink -f /usr/lib/modules/$(uname -r)/extramodules)
  install -Dm 644 facetimehd.ko.gz "$pkgdir/${EXTRA_MODULES}/facetimehd.ko.gz"
  install -Dm 644 "$srcdir/bcwc-pcie.modprobe.conf" \
    "$pkgdir/etc/modprobe.d/bcwc-pcie.conf"
  install -Dm 644 "$srcdir/bcwc-pcie.modules-load.conf" \
    "${pkgdir}/etc/modules-load.d/bcwc-pcie.conf"
}
