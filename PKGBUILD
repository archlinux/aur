# Maintainer: Guoli Lyu <guoli-lv [at] hotmail.com>

_pkgbase=iwlwifi-killer-ax1690-7af0
pkgname=${_pkgbase}-dkms
pkgver=6.2
pkgrel=1
pkgdesc="iwlwifi module patched to support Killer AX1690i/s with device id 7AF0 for kernel ($pkgver)"
arch=('any')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${_pkgbase}.install
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar.xz"
        "dkms.conf"
        "0001-killer-ax1690-7af0.patch")
sha256sums=('74862fa8ab40edae85bb3385c0b71fe103288bce518526d63197800b3cbdecb1'
            '99c57016a22ee6ae218014b4f4f28ce377dc124b80a727036b0b4a471a5cf857'
            '4803e84b644b442860bdd3469850ce5b4b5346705ba6174a987af5f7000c23c6')
options=(!strip)

prepare() {
  cd "$srcdir/linux-$pkgver"
  
  # Patch
  patch -p1 -i "${srcdir}"/0001-killer-ax1690-7af0.patch

  # Patch iwlwifi Makefile
  # Thanks iwlwifi-ax101-dkms by Jerry Xiao
  sed -i 's|$(srctree)/||' drivers/net/wireless/intel/iwlwifi/{d,m}vm/Makefile
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  # Copy sources (including Makefile)
  cp -rT "linux-${pkgver}/drivers/net/wireless/intel/iwlwifi" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"

}
