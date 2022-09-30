# Contributor: Edward Pacman <edward@edward-p.xyz>

pkgname=nft-fullcone-dkms-git
pkgver=r3.0d3e2be
pkgrel=1
pkgdesc="nftables fullcone expression kernel module"
arch=('any')
url="https://github.com/fullcone-nat-nftables/nft-fullcone"
license=('Unknown')
depends=('dkms')
makedepends=('git')
optdepends=('nftables-fullcone: nftables with fullcone')
provides=('nft-fullcone')
conflicts=('nft-fullcone')
source=("nft-fullcone.conf"
        "dkms.conf"
        "Kbuild"
        "${pkgname}::git+https://github.com/fullcone-nat-nftables/nft-fullcone.git")
sha256sums=('7d903951298aea2ae93c92c940986c123bcedd5dd257e7961fdce88aaf301e02'
            '52b241ac66e906455aeed70e7a1c68941a1782342088c306a1a6428705007c87'
            '7b2e2cd7c465a679e7481817768e066ac86c37b6a5e630d61c73f2cc20151953'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Install modules-load.conf
  install -Dm644 nft-fullcone.conf "${pkgdir}/usr/lib/modules-load.d/nft-fullcone.conf"
  # Install Kbuild
  install -Dm644 Kbuild "${pkgdir}/usr/src/${pkgname}-${pkgver}/Kbuild"
  # Install dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
  
  # Install sources (including Makefile)
  install -Dm644 ${pkgname}/src/nf_nat_fullcone.c "${pkgdir}/usr/src/${pkgname}-${pkgver}/nf_nat_fullcone.c"
  install -Dm644 ${pkgname}/src/nf_nat_fullcone.h "${pkgdir}/usr/src/${pkgname}-${pkgver}/nf_nat_fullcone.h"
  install -Dm644 ${pkgname}/src/nft_ext_fullcone.c "${pkgdir}/usr/src/${pkgname}-${pkgver}/nft_ext_fullcone.c"

  # Set name and version
  sed -e "s/@PKGNAME@/${pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf
}
