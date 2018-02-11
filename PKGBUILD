# Maintainer: fatalis <fatalis@fatalis.pw>
pkgname=ida-free
pkgver=7.0
pkgrel=2
pkgdesc="Freeware version of the world's smartest and most feature-full disassembler"
arch=('x86_64')
url='https://www.hex-rays.com/products/ida/'
license=('custom')
makedepends=('fakechroot')
options=('!strip')
_installer='idafree70_linux.run'
source=("https://out7.hex-rays.com/files/${_installer}")
sha256sums=('e38333d6cf844706ec48d154e64740b9b125c388f7b3a541104ba0a9a61321ab')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/"{icons,applications,licenses/${pkgname}}

    # chroot is needed to prevent the installer from creating a single file outside of prefix
    mkdir -p ../tmp
    chmod +x ${_installer}
    fakechroot chroot ../ /${_installer} --mode unattended --prefix "/pkg/${pkgname}/opt/${pkgname}"
    install ../ida-free.desktop "${pkgdir}/usr/share/applications"

    # the installer needlessly makes a lot of files executable
    find "${pkgdir}/opt/${pkgname}" -type f -exec chmod -x {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/ida64"

    rm "${pkgdir}/opt/${pkgname}/"{uninstall*,Uninstall*,assistant}

    ln -s /opt/${pkgname}/appico64.png "${pkgdir}/usr/share/icons/ida-free.png"
    ln -s /opt/${pkgname}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ln -s /opt/${pkgname}/ida64 "${pkgdir}/usr/bin/ida64"
}
