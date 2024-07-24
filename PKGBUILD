# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

pkgbase=corefreq-git
pkgname=(corefreq-client-git corefreq-server-git corefreq-dkms-git)
_gitname=CoreFreq
_pkgbase=${pkgbase%-*}
pkgver=1.98.0.r0.g5aefb1b
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
        '6975aef86f4cb483bfa63cc1d3949bbb82ea7182596741db2a1be9f5886d15273798f50b65ff266ad5eb17267a7a1e26f78b26fed9c62ff366716d82bf4c0b30'
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
