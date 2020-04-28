# Maintainer: perok8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=devdocs-desktop-appimage
_installdir=/opt/${pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="A full-featured desktop app for DevDocs.io."
arch=("x86_64")
url="https://github.com/egoist/devdocs-desktop"
license=("MIT")
_pkgname="DevDocs-${pkgver}.AppImage"
noextract=(${_pkgname})
options=("!strip")
provides=('devdocs-desktop')
source=("https://github.com/egoist/devdocs-desktop/releases/download/v${pkgver}/${_pkgname}")
sha256sums=("5bba99a34c90a65eff67aface0b7446cbf43d620a1c195f27e7bb33ab6d3d0c2")

prepare() {
    cd "${srcdir}"
    chmod a+x ${_pkgname}
    ${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/${_pkgname}+" "squashfs-root/devdocs.desktop"
    mv "squashfs-root/usr/share/icons/hicolor/0x0" "squashfs-root/usr/share/icons/hicolor/1024x1024"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_pkgname}"
    install -Dm644 "squashfs-root/devdocs.desktop" "${pkgdir}/usr/share/applications/devdocs.desktop"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/1024x1024/apps/devdocs.png" "${pkgdir}/usr/share/pixmaps/devdocs.png"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
