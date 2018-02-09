# Maintainer: JSH <jsh6789(at)gmail(dot)com>
# Contributor: Geoffroy Carrier <gcarrier@aur.archlinux.org>

_pkgbase=r8101
pkgname=r8101-dkms
pkgver=1.032.04
pkgrel=3
pkgdesc="r8101 realtek lan drivers (DKMS)"
arch=('i686' 'x86_64')
url="http://www.realtek.com.tw/"
license=('GPL2')
depends=('dkms>=2.2.0.3+git151023-5')
optdepends=('ethtool: device configuration')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")

source=("http://12244.wpc.azureedge.net/8012244/drivers/rtdrivers/cn/nic/0008-${_pkgbase}-${pkgver}.tar.bz2"
        'linux-4.15.patch'
        'dkms.conf')

prepare() {
  cd "r8101-$pkgver"
  
  patch -p1 -i "../linux-4.15.patch"
}

package() {

  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}-${pkgver}/src ${_pkgbase}-${pkgver}/Makefile \
        "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
sha256sums=('cb73c2bae347709009db0de657f7bd0e4a293abf6e8e60a07a97a47867f7b5f7'
            'dc568a0d1f265ae96c76919eab289b727990594906c4ea340c9f9a6f5d4384f6'
            '2846e89fe3fd68c64c71a0f1150873a061571acc63e65cca6d825df7985ad7b5')
