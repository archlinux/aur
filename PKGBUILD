# Maintainer: Yarema aka Knedlyk <yupadmin@gmail.com>

_pkgname=rtl8761usb
pkgname="${_pkgname}-dkms"
pkgver=20201202
pkgrel=1
pkgdesc="Realtek bluetooth modules for RTL8761 usb based devices (DKMS)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://www.xmpow.com/pages/download"
license=('unknown')
depends=('dkms' 'bc') #'linux-headers'
conflicts=("${_pkgname}" 'rtl8761b-fw')
source=("https://mpow.s3-us-west-1.amazonaws.com/${pkgver}_mpow_BH456A_driver+for+Linux.7z"
    "rtl8761usb.conf"
    "dkms.conf"
    )


package() {
  cd ${srcdir}

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  # Copy dkms.conf
  install -Dm644 "$srcdir/dkms.conf" "${install_dir}/dkms.conf"

  # Blacklist btusb
  install -Dm644 "$srcdir/rtl8761usb.conf" "${pkgdir}/etc/modprobe.d/rtl8761usb.conf"

  # Copy firmware
  cd ${srcdir}/${pkgver}_LINUX_BT_DRIVER/rtkbt-firmware/
  for d in $(find . -type d);do install -dm755 "${pkgdir}/usr/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${pkgdir}/usr/$f";done

  # Set name and version
  sed -e "s/@PACKAGE_NAME@/${_pkgname}/" -e "s/@PACKAGE_VERSION@/${pkgver}/"  -i "${install_dir}/dkms.conf"
  # Copy sources

#  cd "${_pkgname}-${pkgver}"
  cd ${srcdir}/${pkgver}_LINUX_BT_DRIVER/usb/bluetooth_usb_driver
  for d in $(find . -type d);do install -dm755 "${install_dir}/$d";done
  for f in $(find . -type f);do install -m644 "$f" "${install_dir}/$f";done
}
md5sums=('994ad1d6f6bd1e63190dfef7f64bbb34'
         '70d0ec0c62293d5c64e0bf148300c998'
         '6af1c381da425c2932e00331db576ced')
