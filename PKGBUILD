# Maintainer: ifaigios <ifaigios [at] gmail.com>

_pkgbase=iwlwifi-killer-ax1690-7f70
pkgname=${_pkgbase}-dkms
pkgver=6.13
pkgrel=1
pkgdesc="iwlwifi module patched to support Killer AX1690i/s with device id 7F70 for kernel ($pkgver)"
arch=('any')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar.xz"
        "dkms.conf"
        "0001-killer-ax1690-7f70.patch")
sha256sums=('e79dcc6eb86695c6babfb07c2861912b635d5075c6cd1cd0567d1ea155f80d6e'
            '99c57016a22ee6ae218014b4f4f28ce377dc124b80a727036b0b4a471a5cf857'
            'da62c6b961bc013d219f7ba8107e78928cac86826017195f9718315d9d955864')
options=(!strip)

prepare() {
  cd "$srcdir/linux-$pkgver"
  
  # Patch
  patch -p1 -i "${srcdir}"/0001-killer-ax1690-7f70.patch

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
