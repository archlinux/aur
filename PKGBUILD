# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

### BUILD OPTIONS
# Set the next variables to ANYTHING that is not null to enable them

# Enable transparency mode in terminal
_transparency=

### Do no edit below this line unless you know what you're doing

pkgbase=corefreq-git
pkgname=(corefreq-client-git corefreq-server-git corefreq-dkms-git)
_gitname=CoreFreq
_pkgbase=${pkgbase%-*}
pkgver=1.97.0.r7.g103f9ad
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
        'a47306b69244b2c7cfe34a5a19aabc7d22ef8982402da038bfb65a357bed9aa0d9f30b034afa7c6dbc23969448142a0027bd14364a14da92b1c666881e15420c'
        '0b409cbc017b5b8d30cf2f291fe288172a8f8a1d773f17e5c860f2a9a929e758731993a2e56a4d0f03364b40481577765a714d8daf7261f2832c02921b347c93')

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
  if [ -n "${_transparency}" ]; then
    make prepare corefreqd corefreq-cli -j UI_TRANSPARENCY=1
  else
    make prepare corefreqd corefreq-cli -j
  fi
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
