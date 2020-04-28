# Maintainer: vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
pkgname=copytranslator-appimage
_installdir=/opt/${pkgname}
pkgver=9.0.2
pkgrel=1
pkgdesc="Foreign language reading and translation assistant based on copy and translate."
arch=("any")
url="https://copytranslator.github.io"
_pkgname="copytranslator-${pkgver}.AppImage"
noextract=(${_pkgname})
options=("!strip")
source=("https://github.com/CopyTranslator/CopyTranslator/releases/download/v${pkgver}/${_pkgname}")
sha256sums=("38abb1add4f24a77afca17c1cd752d670b7675589709785076f762ca92378b48")

prepare() {
    cd "${srcdir}"
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/${_pkgname}+" "squashfs-root/copytranslator.desktop"
    sed -i "s+/opt/copytranslator/resources/linux-icon/icon.png+copytranslator+" "squashfs-root/copytranslator.desktop"
    sed -i "s+Name=copytranslator+Name=CopyTranslator+" "squashfs-root/copytranslator.desktop"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm644 "squashfs-root/copytranslator.desktop" "${pkgdir}/usr/share/applications/copytranslator.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
