# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

pkgbase=corefreq-git
pkgname=(corefreq-client-git corefreq-server-git corefreq-dkms-git)
_gitname=CoreFreq
_pkgbase=${pkgbase%-*}
pkgver=1.97.0.r102.g77ddd76
pkgrel=1
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
source=(git+"${url}.git#branch=develop"
        'dkms.conf'
        'honor-archlinux-compiler-flags.patch')
b2sums=('SKIP'
        'a47306b69244b2c7cfe34a5a19aabc7d22ef8982402da038bfb65a357bed9aa0d9f30b034afa7c6dbc23969448142a0027bd14364a14da92b1c666881e15420c'
        'f4299ed5c44052a521988d417410081ddb92a5f481012f9c7a964ec0dee6a63be6123cef8f8618f23be6827e25aeb3fef93f8c270aaa3076cc1f434a6d4ca861')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "${_gitname}"
  patch -Np1 < "$srcdir/honor-archlinux-compiler-flags.patch"
}

build() {
  cd "${_gitname}"
  make prepare corefreqd corefreq-cli -j
}

package_corefreq-dkms-git() {
  pkgdesc="CoreFreq - kernel module sources"
  depends=('dkms')
  provides=("corefreq-dkms")
  conflicts=('corefreq-dkms')
  _kernelmodule=corefreqk

  # Copy simple dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -e "s/@_KERNELMODULE@/${_kernelmodule}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_gitname}"/{Makefile,scripter.sh} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
  cp -r "${_gitname}"/${CARCH} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}

package_corefreq-server-git() {
  pkgdesc="CoreFreq server"
  depends=("corefreq-dkms")
  provides=('corefreq-server')
  conflicts=('corefreq-server')

  cd "${_gitname}"
  install -Dm755 build/corefreqd "${pkgdir}/usr/bin/corefreqd"
  install -Dm 0644 corefreqd.service "${pkgdir}/usr/lib/systemd/system/corefreqd.service"
}

package_corefreq-client-git() {
  pkgdesc="CoreFreq client"
  depends=("corefreq-server")
  provides=('corefreq-client')
  conflicts=('corefreq-client')

  cd "${_gitname}"
  install -Dm755 build/corefreq-cli "${pkgdir}/usr/bin/corefreq-cli"
}
