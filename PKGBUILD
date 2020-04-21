# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
# Contributor: S Stewart <tda@null.net>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher-classic"
pkgver="0.13.1"
pkgrel=3
arch=('x86_64')
pkgdesc="GDLauncher is simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://github.com/CrankySupertoon/GDLauncher-Classic"
license=('MIT')
install="gdlauncher-classic.install"
depends=('libnotify' 'libxss' 'libxtst' 'libindicator-gtk3' 'libappindicator-gtk3' 'rust')

sha256sums_x86_64=('0ee4d9c7b0336584b3d7a85e1f46395cb54127e1650be5236cb89341b4211fa4'
                   '72c487fc70de98ae58d51a93314747150e544f143a748320d87e5ce687d70a5a')

source_x86_64=(
    "gdlauncher-classic.desktop"
    "GDLauncher-linux-setup.AppImage::https://github.com/CrankySupertoon/GDLauncher-Classic/releases/download/v${pkgver}/GDLauncher-linux-setup.AppImage"
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
    install -D -m644 "${srcdir}/gdlauncher-classic.desktop" "${pkgdir}/usr/share/applications/gdlauncher-classic.desktop"

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
    ln -sr "${pkgdir}/opt/${pkgname}/gdlauncher-classic" "${pkgdir}/usr/bin/gdlauncher-classic"
}
