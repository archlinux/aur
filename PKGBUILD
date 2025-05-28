# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

### BUILD OPTIONS
# Set the next variables to ANYTHING that is not null to enable them

# Enable transparency mode in terminal
_transparency=

### Do no edit below this line unless you know what you're doing

pkgbase=corefreq
pkgname=(corefreq-client corefreq-server corefreq-dkms)
_gitname=CoreFreq
pkgver=2.0.5
pkgrel=1
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL-2.0-only')
depends=('dkms')
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz"
        'dkms.conf'
        'honor-archlinux-compiler-flags.patch')
b2sums=('ca789a91db1eb1ad5f538c45ac36cdf9c483a7ac9dd44bcb6a7ecbc960c0f5e66271bd3c6daa5d07f0ce0ddb25194df3c6f130157949e82a353a3fde11519c34'
        '3ceb7afbeb3c0bb1703e31d2534b23e29282b0d1a539a3792ec14c4131f52d2731917eac91f992ef66ce7a0727d14defca2fa56dc1e537b3c6172339768ccf3f'
        '03396a2b3789908b863600da41e4ef7e598ecb54882a16c9154b0d55235646a68d7b11aac0c8f182503a92224cc95641801fab10682465af9e84639598dfc6f6')

prepare(){
  cd "${_gitname}-${pkgver}"
  patch -Np1 < "$srcdir/honor-archlinux-compiler-flags.patch"
}

build() {
  cd "${_gitname}-${pkgver}"
  make prepare corefreqd corefreq-cli -j
}

package_corefreq-dkms() {
  pkgdesc="CoreFreq - kernel module sources"
  depends=('dkms')
  _kernelmodule=corefreqk

  # Copy simple dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -e "s/@_KERNELMODULE@/${_kernelmodule}/" \
      -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_gitname}-${pkgver}"/{Makefile,scripter.sh} "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
  cp -r "${_gitname}-${pkgver}"/${CARCH} "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}

package_corefreq-server() {
  pkgdesc="CoreFreq server"
  depends=("corefreq-dkms=$pkgver")

  cd "${_gitname}-${pkgver}"
  install -Dm755 build/corefreqd "${pkgdir}/usr/bin/corefreqd"
  install -Dm 0644 corefreqd.service "${pkgdir}/usr/lib/systemd/system/corefreqd.service"
}

package_corefreq-client() {
  pkgdesc="CoreFreq client"
  depends=("corefreq-server=$pkgver")

  cd "${_gitname}-${pkgver}"
  install -Dm755 build/corefreq-cli "${pkgdir}/usr/bin/corefreq-cli"
}
