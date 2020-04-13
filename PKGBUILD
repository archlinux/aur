# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Contributor: S Stewart <tda@null.net>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher"
pkgver="0.0.2"
pkgrel=1
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdevs.io"
license=('GPL3')
install="gdlauncher.install"
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'rust')
sha256sums_x86_64=('9b512c4b92ee7405e3774aa66348636738e30866a8227937578aaa67cfc8ed51'
                   'b10f7d115d7aaaaff128c03b9f679cbd968a61c61a19d228cfd131ba7c658ab7')
source_x86_64=(
    "gdlauncher.desktop"
    "GDLauncher-linux-setup.AppImage::https://github.com/gorilla-devs/GDLauncher-Releases/releases/download/v${pkgver}/GDLauncher-linux-setup.AppImage"
)

prepare() {
    # mark as executable
    chmod +x "${srcdir}/GDLauncher-linux-setup.AppImage"
    # extract (didn't know this was possible)
    "${srcdir}/GDLauncher-linux-setup.AppImage" --appimage-extract
    # executable isnt needed now
    chmod -x "${srcdir}/GDLauncher-linux-setup.AppImage"
}

package() {
    # install the main files.
    install -d -m755 "${pkgdir}/opt/${pkgname}"
    cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

    # desktop entry
    install -D -m644 "${srcdir}/gdlauncher.desktop" "${pkgdir}/usr/share/applications/gdlauncher.desktop"

    # install the icons
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
    cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" "${pkgdir}/usr/share/icons/hicolor"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${pkgname}/gdlauncher"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${pkgname}/gdlauncher" "${pkgdir}/usr/bin/gdlauncher"
}
