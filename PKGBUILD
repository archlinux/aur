# Maintainer: 'Patryk Kowalczyk <patryk at kowalczyk dot ws>'

_srcname=iwlwifi-lar-disable
pkgname=${_srcname}-dkms
pkgver=6.13.2
pkgrel=1
pkgdesc="Intel wireless chips driver from linux ($pkgver) with patch for lar_disable parameter 5GHz band support"
arch=('any')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL2')
depends=('dkms')
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar.xz"
        "dkms.conf"
	"c545b26dd567a638d62ca29490e9e2e6d04a8b6b.patch")
md5sums=('437f6b439649d8c4c0dd03fda817f443'
         '730652a6fd46eaa97c001c01ea14dc91'
         '29336370f1863ad94c15dc3fbef9b63c')

options=(!strip)

prepare() {
  cd "$srcdir/linux-$pkgver"
  cd drivers/net/wireless/intel/iwlwifi

  # https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1910510.html
  sed -i 's|$(srctree)/||' {d,m}vm/Makefile
  cd -
  patch -p1 -i "$srcdir/c545b26dd567a638d62ca29490e9e2e6d04a8b6b.patch"
}


package() {

  # Install dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_srcname}-${pkgver}/dkms.conf"
  
  # Install sources (including Makefile)
  cp -rT "linux-${pkgver}/drivers/net/wireless/intel/iwlwifi" "${pkgdir}/usr/src/${_srcname}-${pkgver}"

  # Set name and version
  sed -e "s/@PKGNAME@/${_srcname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}"/usr/src/${_srcname}-${pkgver}/dkms.conf
}

