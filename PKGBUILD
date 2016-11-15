# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname="bcwc-pcie-dkms"
pkgver=0r213.bb3c229
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod' 'bcwc-pcie-firmware' 'dkms' 'linux-headers')
makedepends=('git')
conflicts=("bcwc-pcie" "bcwc-pcie-git")
provides=("bcwc-pcie")
install="$pkgname.install"

source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git"
        "bcwc-pcie.modprobe.conf"
        "bcwc-pcie.modules-load.conf")
md5sums=('SKIP'
         '7531f220d5c3dd0ab5c31c445d526d7f'
         'd8dc0e4e125b7887b226bda0c28f30be')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/"

  install -Dm 644 $pkgname/dkms.conf "${pkgdir}/usr/src/bcwc-pcie-${pkgver}/dkms.conf"

  cd $srcdir/$pkgname
  rm -rf .git
  for FILE in $(find -type f); do
    install -Dm 644 "$FILE" "$pkgdir/usr/src/${pkgname/-dkms/}-${pkgver}/$FILE"
  done

  install -Dm 644 "$srcdir/bcwc-pcie.modprobe.conf" \
    "$pkgdir/etc/modprobe.d/bcwc-pcie.conf"
  install -Dm 644 "$srcdir/bcwc-pcie.modules-load.conf" \
    "${pkgdir}/etc/modules-load.d/bcwc-pcie.conf"
}
