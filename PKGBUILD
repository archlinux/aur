# Maintainer: Aetf <aetf@unlimitedcodeworks.xyz>
# Co-Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Co-Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=bcwc-pcie-git
pkgver=r242.ea832ac
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod' 'facetimehd-firmware' 'dkms')
makedepends=('git')
optdepends=(
    'linux-headers: Building with the stock kernel'
    'linux-lts-headers: Building with the lts kernel'
)
provides=('bcwc-pcie' 'bcwc-pcie-dkms')
replaces=('bcwc-pcie' 'bcwc-pcie-dkms')

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

package() {
  cd $srcdir/$pkgname

  for FILE in dkms.conf Makefile *.[ch]; do
    install -Dm 644 "$FILE" "$pkgdir/usr/src/${pkgname/-git/}-${pkgver}/$FILE"
  done

  install -Dm 644 "$srcdir/bcwc-pcie.modprobe.conf" \
    "$pkgdir/etc/modprobe.d/bcwc-pcie.conf"
  install -Dm 644 "$srcdir/bcwc-pcie.modules-load.conf" \
    "${pkgdir}/etc/modules-load.d/bcwc-pcie.conf"
}
