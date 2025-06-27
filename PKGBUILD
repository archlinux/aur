# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

pkgbase=corefreq-git
pkgname=(corefreq-client-git corefreq-server-git corefreq-dkms-git)
_gitname=CoreFreq
_pkgbase=${pkgbase%-*}
pkgver=2.0.7.r20.gdeb3da7
pkgrel=1
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
source=(git+"${url}.git#branch=master"
        'dkms.conf'
        'honor-archlinux-compiler-flags.patch')
b2sums=('SKIP'
        '6975aef86f4cb483bfa63cc1d3949bbb82ea7182596741db2a1be9f5886d15273798f50b65ff266ad5eb17267a7a1e26f78b26fed9c62ff366716d82bf4c0b30'
        'a2adeb075993472552803805b9fb644a0c09104a8fc979be552638a186a7cc886dfc12db8b3de82b1b579627992b58f150b6a85467f185d4ed9e1dc0fdb4f3cd')

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
  make corefreqd corefreq-cli -j
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
