# Maintainer: S Stewart <tda@lmao.tf>
# Special thanks to RyanTheAllmighty for making hyper-appimage
pkgname="gdlauncher-appimage"
pkgver="v0.12.3"
pkgrel=1
arch=('x86_64')
pkgdesc="Modded Minecraft launcher built with Electron/React"
url="https://gdevs.io"
license=('MIT')
install="gdlauncher-appimage.install"
depends=('libnotify' 'libxss' 'libxtst' 'gconf' 'libindicator' 'libappindicator')

source_x86_64=(
    "gdlauncher.desktop"
    "GDLauncher-linux-setup.AppImage::https://github.com/gorilla-devs/GDLauncher/releases/download/${pkgver}/GDLauncher-linux-setup.AppImage"
)

md5sums_x86_64=(
    "310ff29d9c622367e31b989610a47617"
    "5e2b0ac22c2b60f2f31f05ccf63a683f"
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
