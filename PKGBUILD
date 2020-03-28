# Maintainer: perok8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>

pkgname=devdocs-desktop-appimage
_installdir=/opt/${pkgname}
pkgver=0.7.1
pkgrel=1
pkgdesc="A full-featured desktop app for DevDocs.io."
arch=("x86_64")
url="https://github.com/egoist/devdocs-desktop"
license=("MIT")
noextract=("DevDocs-${pkgver}.AppImage")
options=("!strip")
provides=('devdocs-desktop')
source=("https://github.com/egoist/devdocs-desktop/releases/download/v${pkgver}/DevDocs-${pkgver}.AppImage")
sha256sums=("5bba99a34c90a65eff67aface0b7446cbf43d620a1c195f27e7bb33ab6d3d0c2")

prepare() {
    cd "${srcdir}"
    mv "DevDocs-${pkgver}.AppImage" "DevDocs.AppImage"
    chmod a+x "DevDocs.AppImage"
    ${srcdir}/DevDocs.AppImage --appimage-extract
    sed -i "s+AppRun+env DESKTOPINTEGRATION=no ${_installdir}/DevDocs.AppImage %U+" "squashfs-root/devdocs.desktop"
    mv "squashfs-root/usr/share/icons/hicolor/0x0" "squashfs-root/usr/share/icons/hicolor/1024x1024"
    find "squashfs-root/usr/share/icons/hicolor" -type d -exec chmod 755 {} \;
}

package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm755 "DevDocs.AppImage" "${pkgdir}/${_installdir}/DevDocs.AppImage"
    install -Dm644 "squashfs-root/devdocs.desktop" "${pkgdir}/usr/share/applications/devdocs.desktop"
    cp -R "squashfs-root/usr/share/icons/hicolor" "${pkgdir}/usr/share/icons"
}
