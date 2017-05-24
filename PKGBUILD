# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Co-Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname="bcwc-pcie-git"
pkgver=r252.fcdcc9a
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam."
arch=('x86_64')
url="https://github.com/patjak/bcwc_pcie"
license=('unknown')
depends=('kmod' 'facetimehd-firmware' 'dkms')
makedepends=('linux-headers' 'git')
optdepends=('linux-headers: Building with the stock kernel')
provides=('bcwc-pcie' 'bcwc-pcie-dkms')
replaces=('bcwc-pcie' 'bcwc-pcie-dkms')
install="$pkgname.install"

source=("$pkgname::git+https://github.com/patjak/bcwc_pcie.git#branch=mainline"
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

  # add dkms config
  git cherry-pick 76945312a9d2e786bebc9bb5711f5962365c5c20
  git cherry-pick 4901c363e8688a46b83bfcbee92c1588dca6054c

  for FILE in dkms.conf Makefile *.[ch]; do
    install -Dm 644 "$FILE" "$pkgdir/usr/src/${pkgname/-dkms/}-${pkgver}/$FILE"
  done

  install -Dm 644 "$srcdir/bcwc-pcie.modprobe.conf" \
    "$pkgdir/etc/modprobe.d/bcwc-pcie.conf"
  install -Dm 644 "$srcdir/bcwc-pcie.modules-load.conf" \
    "${pkgdir}/etc/modules-load.d/bcwc-pcie.conf"
}
