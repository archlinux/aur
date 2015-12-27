# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-git"
pkgver=latest
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod' 'bcwc-pcie-firmware')
makedepends=('linux' 'linux-headers' 'git')
install="$pkgname.install"

source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git"
        "bcwc-pcie.modprobe.conf")
md5sums=('SKIP'
         '7531f220d5c3dd0ab5c31c445d526d7f')

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

  KERNEL_VERSION=$(uname -r | cut -d '.' -f 1,2)
  install -Dm 644 facetimehd.ko.gz \
    "$pkgdir/usr/lib/modules/extramodules-${KERNEL_VERSION}-ARCH/facetimehd.ko.gz"
  install -Dm 644 "$srcdir/bcwc-pcie.modprobe.conf" \
    "$pkgdir/etc/modprobe.d/bcwc-pcie.conf"
}
