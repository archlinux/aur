# Maintainer: Shen-Ta Hsieh <ibmibmibm(at)gmail(dot)com>
# Contributor: Shen-Ta Hsieh <ibmibmibm(at)gmail(dot)com>

_pkgbase=r8125
pkgname=(r8125 r8125-dkms)
pkgver=9.002.02
pkgrel=0
pkgdesc="r8125 kernel driver for linux"
arch=('x86_64')
url="https://www.realtek.com/"
license=('GPL2')
source=("https://github.com/ibmibmibm/r8125/archive/${pkgver}.tar.gz"
        'dkms.conf')
sha256sums=('046d880547f2a1b817172621b046ebfc2d5ab951b636625be792252977eaf9ae'
            '207a1de30627947950d1dbafc1e45f719e996e4d0ab7dd8c9c2530cc74bea0c9')

build() {
  tar -xf "${pkgver}.tar.gz"
  cd ${_pkgbase}-${pkgver}
  make modules
}

package_r8125() {
  # Install
  msg2 "Starting make install..."
  install -Dt "${pkgdir}/usr/lib/modules/extramodules-ARCH/" -m644 "${_pkgbase}-${pkgver}/src/r8125.ko"
  find "${pkgdir}" -name '*.ko' -exec gzip -n {} +
}

package_r8125-dkms() {
  pkgdesc="r8125 kernel driver sources for linux"
  depends=('dkms')
  optdepends=('linux-headers: Build the module for Arch kernel'
              'linux-lts-headers: Build the module for LTS Arch kernel')
  provides=("8125=$pkgver")
  conflicts+=(r8125)
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-${pkgver}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
