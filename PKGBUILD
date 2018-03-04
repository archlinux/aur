# Maintainer: Tomoya Onozuka <t [dot] (family name in lower case) [dot] 1990 [at] gmail [dot] com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>
pkgname=('ni-visa')
_pkgbase=('ni-visa')
pkgver=17.0.0
_short_ver=${pkgver%.0}
pkgrel=1
pkgdesc="National Instruments NI-VISA(TM) Library for Linux."
url="https://www.ni.com/visa/"
arch=('x86_64')
license=('custom')
depends=('gcc-libs')
optdepends=('python2-pyvisa: python 2 frontend'
'python-pyvisa: python 3 frontend')
source=("http://ftp.ni.com/support/softlib/visa/NI-VISA/${_short_ver}/Linux/NI-VISA-${pkgver}.iso"
"99-usbtmc.rules")
md5sums=('d114b70ce0802fa6bd7173a6f23f7257'
         'cdfd2e18de4370001bfbe0226cf04b18')
install='ni-visa.install'

prepare() {
  bsdtar -xvf ${srcdir}/nivisa-${pkgver}f*.tar.gz

  cd "${srcdir}"
  for f in ${srcdir}/rpms/*.rpm; do
    bsdtar -xf $f
  done
  sed -i -e 's/passportEnabled2 = 1/passportEnabled2 = 0/' "${srcdir}/usr/local/vxipnp/linux/NIvisa/Passport64/nivisa.ini"
  sed -i -e 's/passportEnabled2 = 1/passportEnabled3 = 0/' "${srcdir}/usr/local/vxipnp/linux/NIvisa/Passport/nivisa.ini"
}

package() {
  _vxipnppath="opt/${_pkgbase}/usr/local/vxipnp"
  mkdir -p "${pkgdir}/usr/"{include,lib} "${pkgdir}/${_vxipnppath}/linux/" "${pkgdir}/etc/profile.d"

  cp -R "${srcdir}/usr/local/vxipnp/linux/"{include,lib64} "${pkgdir}/${_vxipnppath}/linux/"
  install -Dm644 "${srcdir}/usr/local/vxipnp/linux/NIvisa/Passport64/nivisa.ini" "${pkgdir}/${_vxipnppath}/linux/NIvisa/Passport64/nivisa.ini"

  for f in "${pkgdir}/${_vxipnppath}/linux/lib64/"*.so; do
    ln -s "${f#${pkgdir}}" "${pkgdir}/usr/lib/"
  done
  for f in "${pkgdir}/${_vxipnppath}/linux/include/"*.h; do
    ln -s "${f#${pkgdir}}" "${pkgdir}/usr/include/"
  done

  install -Dm644 99-usbtmc.rules "${pkgdir}/usr/lib/udev/rules.d/99-usbtmc.rules"
  echo "export VXIPNPPATH=/${_vxipnppath}" > "${pkgdir}/etc/profile.d/vxipnppath.sh"
  install -D -m644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
