# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

pkgbase=corefreq
pkgname=(corefreq-client corefreq-server corefreq-dkms)
_gitname=CoreFreq
pkgver=1.85
pkgrel=2
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL2')
depends=('dkms')
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz"
        'dkms.conf')
b2sums=('a9a18314e6bc7b443cd3434fce108709141c7bff25eb78c208bbc25f37acaa94028b60a08a763fd49d8e3fa02bcb4fc02c20eeda3b1300e75d4e43395c14a70d'
        'c6d8849944f99195038ac252d010d3e3001cd1dcaee57218c4a7f58fa313aa38842e4ea991d4d9ff7d04063ebaa9900c06ff1eacfa6270341cf37fb752adc00c')

build() {
  cd "${_gitname}-${pkgver}"
  make corefreqd corefreq-cli
}

package_corefreq-dkms() {
  pkgdesc="CoreFreq - kernel module sources"
  depends=('dkms')
  provides=("corefreq-dkms=$pkgver")
  _kernelmodule=corefreqk

  # Copy simple dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -e "s/@_KERNELMODULE@/${_kernelmodule}/" \
      -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
  
  # Copy sources (including Makefile)
  cp -r "${_gitname}-${pkgver}"/{*.c,*.h,Makefile} "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}

package_corefreq-server() {
  pkgdesc="CoreFreq server"
  depends=("corefreq-dkms=$pkgver")
  provides=('corefreq-server')

  cd "${_gitname}-${pkgver}"
  install -Dm755 corefreqd "${pkgdir}/usr/bin/corefreqd"
  install -Dm 0644 corefreqd.service "${pkgdir}/usr/lib/systemd/system/corefreqd.service"
}

package_corefreq-client() {
  pkgdesc="CoreFreq client"
  depends=("corefreq-server=$pkgver")
  provides=('corefreq-client')

  cd "${_gitname}-${pkgver}"
  install -Dm755 corefreq-cli "${pkgdir}/usr/bin/corefreq-cli"
}
