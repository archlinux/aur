# Maintainer: Jerry Xiao <aur at mail.jerryxiao.cc>

_srcname=iwlwifi-ax101
pkgname=${_srcname}-dkms
pkgver=6.2
pkgrel=3
pkgdesc="Intel wireless chips driver fixed for ax101 from linux ($pkgver)"
arch=('any')
url="https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi"
license=('GPL2')
depends=('dkms')
source=("https://www.kernel.org/pub/linux/kernel/v${pkgver%%.*}.x/linux-${pkgver}.tar.xz"
        "dkms.conf"
        "0001-ax101.patch")
sha256sums=('74862fa8ab40edae85bb3385c0b71fe103288bce518526d63197800b3cbdecb1'
            'f17ed01e8bfb36dfbf62982a29ad87b5c4ac86d8a5b2fb33716f844c3ff12824'
            '4d3a12b9e44d4e8ef3b6dead7203f4b8798b2ec512109e1e0aa47264b24c7b75')
options=(!strip)

prepare() {
  cd "$srcdir/linux-$pkgver"
  cd drivers/net/wireless/intel/iwlwifi

  # https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1910510.html
  sed -i 's|$(srctree)/||' {d,m}vm/Makefile

  patch -p1 -i "$srcdir/0001-ax101.patch"
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
