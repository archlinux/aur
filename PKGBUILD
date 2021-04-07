# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

pkgbase=corefreq-git
pkgname=(corefreq-client-git corefreq-server-git corefreq-dkms-git)
_gitname=CoreFreq
_pkgbase=corefreq
pkgver=1.84.r13.gb9c84b0
pkgrel=1
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL2')
depends=('dkms')
source=(git+"${url}.git#branch=develop"
        'dkms.conf')
b2sums=('SKIP'
        'c6d8849944f99195038ac252d010d3e3001cd1dcaee57218c4a7f58fa313aa38842e4ea991d4d9ff7d04063ebaa9900c06ff1eacfa6270341cf37fb752adc00c')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"
  make corefreqd corefreq-cli
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
  cp -r "${_gitname}"/{*.c,*.h,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"
}

package_corefreq-server-git() {
  pkgdesc="CoreFreq server"
  depends=("corefreq-dkms")
  provides=('corefreq-server')
  conflicts=('corefreq-server')

  cd "${_gitname}"
  install -Dm755 corefreqd "${pkgdir}/usr/bin/corefreqd"
  install -Dm 0644 corefreqd.service "${pkgdir}/usr/lib/systemd/system/corefreqd.service"
}

package_corefreq-client-git() {
  pkgdesc="CoreFreq client"
  depends=("corefreq-server")
  provides=('corefreq-client')
  conflicts=('corefreq-client')

  cd "${_gitname}"
  install -Dm755 corefreq-cli "${pkgdir}/usr/bin/corefreq-cli"
}
