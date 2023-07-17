# Maintainer: Yarema aka Knedlyk <yupadmin@gmail.com>

_pkgname=rtl8761usb
pkgname="${_pkgname}-dkms"
pkgver=20200610
pkgrel=3
pkgdesc="Realtek bluetooth modules for RTL8761 usb based devices (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.xmpow.com/pages/download"
license=('unknown')
depends=('dkms' 'bc') #'linux-headers'
conflicts=("${_pkgname}" 'rtl8761b-fw')
#source=("https://mpow.s3-us-west-1.amazonaws.com/${pkgver}_mpow_BH456A_driver+for+Linux.7z"
source=("https://archive.org/download/mpow_mpbh456ab_driverforlinux/mpow_MPBH456AB_driver%2Bfor%2BLinux.tgz"
    "rtl8761usb.conf"
    "dkms.conf"
    "Makefile.patch"
    )

package() {
  cd ${srcdir}

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  # Copy dkms.conf
  install -Dm644 "${srcdir}/dkms.conf" "${install_dir}/dkms.conf"

  # Blacklist btusb
  install -Dm644 "${srcdir}/rtl8761usb.conf" "${pkgdir}/etc/modprobe.d/rtl8761usb.conf"

  # Copy firmware
  cd ${srcdir}/${pkgver}_LINUX_BT_DRIVER/rtkbt-firmware/
  for d in $(find . -type d);do install -dm755 "${pkgdir}/usr/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${pkgdir}/usr/$f";done

  # Set name and version
  sed -e "s/@PACKAGE_NAME@/${_pkgname}/" -e "s/@PACKAGE_VERSION@/${pkgver}/"  -i "${install_dir}/dkms.conf"
  # Copy sources

#  cd "${_pkgname}-${pkgver}"
  cd ${srcdir}/${pkgver}_LINUX_BT_DRIVER/usb/bluetooth_usb_driver
#  sed -i 's/rtk_btusb/rtl8761usb/g'  Makefile
  patch --strip=0 < ${srcdir}/Makefile.patch
  for d in $(find . -type d);do install -dm755 "${install_dir}/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${install_dir}/$f";done
}
sha256sums=('74001cd412363485751a8e11dda7de54919de51a74d7f060ce489d0a9291040b'
            '49fd7d83509ce7ec6797b987719ddbbc9168656374a360a35fe8a1ef8b52cee5'
            '9ff12db0338709ac3b1f6c2c8e14a9e715f89283da716ff83e71012136820027'
            'cce5da3c3c05ccac84bda25246200a80747da3f8ec5fb15be860b79c22a6414c')
