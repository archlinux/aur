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
pkgver=2.0.7
pkgrel=1
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL-2.0-only')
depends=('dkms')
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz"
        'dkms.conf'
        'honor-archlinux-compiler-flags.patch')
b2sums=('98988b5524aa21ec551de120b19b93e7c1c8d63aba58122e2c3f5b44303dd0f1633756c441ab4f470a4e38c00036eec55856d2b3685cd1a1a8dd1027dd6150d2'
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
