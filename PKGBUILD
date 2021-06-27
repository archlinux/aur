# Maintainer: Yarema aka Knedlyk <yupadmin@gmail.com>

_pkgname=rtl8761usb
pkgname="${_pkgname}-dkms"
pkgver=20201202
pkgrel=3
pkgdesc="Realtek bluetooth modules for RTL8761 usb based devices (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.xmpow.com/pages/download"
license=('unknown')
depends=('dkms' 'bc') #'linux-headers'
conflicts=("${_pkgname}" 'rtl8761b-fw')
source=("https://mpow.s3-us-west-1.amazonaws.com/${pkgver}_mpow_BH456A_driver+for+Linux.7z"
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
md5sums=('994ad1d6f6bd1e63190dfef7f64bbb34'
         '70d0ec0c62293d5c64e0bf148300c998'
         '5a5426f2a32be28f0ed00f2cb79731a9'
         'c9a3067a72131a4b196b5ed833507c08')
