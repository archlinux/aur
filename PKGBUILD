# Maintainer:  edward-p <edward AT edward-p DOT xyz>

pkgname=ida-freeware
pkgver=7.0
pkgrel=2
pkgdesc="The freeware version of IDA v7.0"
arch=('x86_64')
url='https://www.hex-rays.com/products/ida/support/download_freeware.shtml'
license=('Custom')
depends=('qt5-base')
makedepends=('fakechroot')
options=('!strip')
source=("https://out7.hex-rays.com/files/idafree${pkgver/./}_linux.run"
        "ida-freeware.desktop")
sha256sums=('136e0e1995f16e1ff85244c269450fa91fb5454a565ca7623712f34ac004e245'
            '7b313d7980e79148a0f6acd43cb80da6c1a29804c7a0995462743423b442be92')

_installer="idafree${pkgver/./}_linux.run"

package() {
  cd "${srcdir}"

  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/"{pixmaps,applications,"licenses/${pkgname}"}
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/tmp"

  # chroot is needed to prevent the installer from creating a single file outside of prefix
  # have to copy the installer due to chroot
  cp "${srcdir}/${_installer}" "${pkgdir}/"
  chmod +x "${pkgdir}/${_installer}"
  fakechroot chroot "${pkgdir}" "/${_installer}" --mode unattended \
      --prefix "/usr/lib/${pkgname}" --installpassword ''
  rm "${pkgdir}/${_installer}"
  rm -R "${pkgdir}/tmp"

  # the installer needlessly makes a lot of files executable
  find "${pkgdir}/usr/lib/${pkgname}" -type f -exec chmod -x {} \;
  chmod +x "${pkgdir}/usr/lib/${pkgname}/"{ida64,assistant}

  rm "${pkgdir}/usr/lib/${pkgname}/"{uninstall*,Uninstall*}

  install "${srcdir}/ida-freeware.desktop" "${pkgdir}/usr/share/applications/ida-freeware.desktop"
  ln -s "/usr/lib/${pkgname}/appico64.png" "${pkgdir}/usr/share/pixmaps/ida-freeware.png"
  ln -s "/usr/lib/${pkgname}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s "/usr/lib/${pkgname}/ida64" "${pkgdir}/usr/bin/ida64-free"

}

