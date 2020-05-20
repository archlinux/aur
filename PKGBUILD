# Maintainer: Digimezzo <raphael@digimezzo.com>
_pkgname=Knowte
pkgname=knowte
pkgver=2.0.3
pkgrel=1
pkgdesc="Knowte is a note taking application that allows you to quickly and easily organize and find your notes."
arch=('x86_64')
url="https://www.digimezzo.com"
license=('GPL3')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=(!strip)
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/digimezzo/${pkgname}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver}.AppImage")
sha256sums=('bae0f53bc08c5eb7934a25659cd88e46b5e739c598fcff28f6ea91a618c6d110')

prepare() {
    chmod u+x      ${srcdir}/${_pkgname}-${pkgver}.AppImage

    ${srcdir}/${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${pkgname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${pkgname}

    # remove broken or unused files and directories
    rm -r          ${pkgdir}/opt/${pkgname}/usr/
    rm             ${pkgdir}/opt/${pkgname}/knowte
    rm             ${pkgdir}/opt/${pkgname}/${pkgname}.desktop
    rm             ${pkgdir}/opt/${pkgname}/${pkgname}.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${pkgname}/${pkgname}                ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/squashfs-root/${pkgname}.desktop                   ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

