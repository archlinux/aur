# Maintainer: yl <1016076582@qq.com>
# Contributor: tuxedocomputers <https://www.tuxedocomputers.com/>


_pkgbase=yt6801
pkgname=yt6801-dkms
pkgver=1.0.28
pkgrel=3
pkgdesc="Kernel module for Motorcomm YT6801 ethernet controller (DKMS)"
arch=('x86_64')
url="https://deb.tuxedocomputers.com/ubuntu/pool/main/t/tuxedo-yt6801/"
license=('GPL-2.0-or-later')
depends=(
  'dkms'
  'dos2unix')
_fullname=${_pkgbase}-${pkgver}
source=("${_fullname}.tar.gz::${url}/tuxedo-${_pkgbase}_${pkgver}.orig.tar.gz")
sha256sums=('5ccc8392fee345eb89b6a94b596ce1637ebda0490f1915dcaa78137ec9564f9e')

package() {
  cd ${srcdir}
  # change dkms.conf to CRLF
  find . -type f -exec dos2unix {} \;
  
  # Filter out REMAKE_INITRD from dkms.conf
  awk '{ if ($0 !~ "REMAKE_INITRD") print }' dkms.conf > dkms_filtered.conf

  # Copy dkms.conf
  install -Dm644 dkms_filtered.conf ${pkgdir}/usr/src/${_fullname}/dkms.conf

  sed -i -e "1i KERNELRELEASE ?= \$(shell uname -r)" \
      -e "s|^KSRC = .*|KSRC = /lib/modules/\$(KERNELRELEASE)/build|" \
      -e "s|^KDST = .*|KDST = /lib/modules/\$(KERNELRELEASE)/kernel/drivers/net/ethernet/motorcomm/|" \
      Makefile

  # Copy sources (including Makefile)
  install -Dm644 ${srcdir}/*.c ${pkgdir}/usr/src/${_fullname}/
  install -Dm644 ${srcdir}/*.h ${pkgdir}/usr/src/${_fullname}/
  install -Dm644 ${srcdir}/Makefile ${pkgdir}/usr/src/${_fullname}/
}
