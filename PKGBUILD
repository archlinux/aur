# Maintainer: Yi Kuo <yi [at] yikuo.dev>
# Contributor: Jerry Xiao <aur at mail.jerryxiao.cc>

_pkgbase=iwlwifi-killer-ax1675-51f1
pkgname=${_pkgbase}-dkms
pkgver=6.2
pkgrel=1
pkgdesc="iwlwifi module patched to support Killer AX1765i/s with device id 51F1 for kernel ($pkgver)"
arch=('any')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
install=${_pkgbase}.install
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar.xz"
        "dkms.conf"
        "0001-killer-ax1675-51f1.patch")
sha256sums=('74862fa8ab40edae85bb3385c0b71fe103288bce518526d63197800b3cbdecb1'
            'c9695d054c81b8547f117905bf4f616ad677bf868e8c355425f09cb769c509aa'
            'cfe120a534638b6e4ce40d97eec35347145828143864d68a43434c65ffd93dda')
options=(!strip)

prepare() {
  cd "$srcdir/linux-$pkgver"
  
  # Patch
  patch -p1 -i "${srcdir}"/0001-killer-ax1675-51f1.patch

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
