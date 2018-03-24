# Maintainer: t-onoz <t [dot] onozuka [dot] 1990 [at] (g-mail)>>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
pkgname=('ni-visa')
_pkgbase=('ni-visa')
provides=('ni-visa' 'lib32-ni-visa')
pkgver=17.0.0
_short_ver=${pkgver%.0}
pkgrel=2
pkgdesc="National Instruments NI-VISA(TM) Library for Linux."
url="https://www.ni.com/visa/"
arch=('x86_64')
license=('custom')
depends=('gcc-libs' 'bash')
optdepends=('python2-pyvisa: python 2 frontend'
'python-pyvisa: python 3 frontend'
'lib32-gcc-libs: for 32-bit libraries')
source=("http://ftp.ni.com/support/softlib/visa/NI-VISA/${_short_ver}/Linux/NI-VISA-${pkgver}.iso"
"ni-visa.patch"
"99-usbtmc.rules")
md5sums=('d114b70ce0802fa6bd7173a6f23f7257'
         'd46807a8283d8497d316778ac266d514'
         'cdfd2e18de4370001bfbe0226cf04b18')
install='ni-visa.install'

_vxipnppath="opt/${_pkgbase}/usr/local/vxipnp"

backup=("${_vxipnppath}/linux/NIvisa/Passport64/nivisa.ini"
  "${_vxipnppath}/linux/NIvisa/Passport/nivisa.ini"
  "${_vxipnppath}/linux/NIvisa/visaconf.ini"
  "etc/udev/rules.d/99-nivisa_usbraw.rules")

prepare() {
  bsdtar -xf "${srcdir}"/nivisa-${pkgver}f*.tar.gz
  mkdir -p "${srcdir}"/extract
  for f in "${srcdir}"/rpms/nivisa{-32bit,}-${pkgver}-f*.x86_64.rpm; do
    bsdtar -xf $f -C "${srcdir}"/extract
  done
  cd "${srcdir}"
  patch -p1 -i "${srcdir}"/ni-visa.patch
}

package() {
  mkdir -p "${pkgdir}"/usr/{include,lib,lib32,bin}
  mkdir -p "${pkgdir}"/opt/${_pkgbase}/usr/local/
  mkdir -p "${pkgdir}"/etc/{profile.d,natinst}
  mkdir -p "${pkgdir}"/etc/udev/rules.d

  echo > "${pkgdir}"/etc/udev/rules.d/99-nivisa_usbraw.rules

  cp -a "${srcdir}"/extract/usr/local/vxipnp "${pkgdir}"/${_vxipnppath}

  ln -s /${_vxipnppath}/linux/lib64/libvisa.so "${pkgdir}"/usr/lib/libvisa.so
  ln -s /${_vxipnppath}/linux/bin/libvisa.so "${pkgdir}"/usr/lib32/libvisa.so
  for f in "${pkgdir}/${_vxipnppath}/linux/include/"*.h; do
    ln -s "${f#${pkgdir}}" "${pkgdir}/usr/include/"
  done

  echo "/${_vxipnppath}" > "${pkgdir}"/${_vxipnppath}/etc/nivisa.dir
  echo "/${_vxipnppath}" > "${pkgdir}"/${_vxipnppath}/etc/vxipnp.dir
  ln -s /${_vxipnppath}/etc "${pkgdir}"/etc/natinst/nivisa
  ln -s /${_vxipnppath}/etc "${pkgdir}"/etc/natinst/vxipnp

  ln -s /${_vxipnppath}/linux/NIvisa/USB/AddUsbRawPermissions.sh "${pkgdir}"/usr/bin/AddUsbRawPermissions.sh

  install -Dm644 99-usbtmc.rules "${pkgdir}/usr/lib/udev/rules.d/99-usbtmc.rules"
  echo "export VXIPNPPATH=/${_vxipnppath}" > "${pkgdir}/etc/profile.d/vxipnppath.sh"
  install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
