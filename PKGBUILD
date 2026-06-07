
pkgname=labymodlauncher-bin
pkgver=3.0.6
pkgrel=1
pkgdesc="Laby Launcher (official)"
arch=('x86_64')
url="https://www.laby.net/"
license=('LicenseRef-Proprietary')
depends=('gtk3' 'nss' 'alsa-lib')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-3.0.6.AppImage")
sha256sums=('9a686533a582bfef1f33a60e702fb9c2eb22c208b72175bd7de569d15f994378')

package() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null

    install -dm755 "${pkgdir}/opt/labymodlauncher-bin"
    cp -a squashfs-root/. "${pkgdir}/opt/labymodlauncher-bin/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/labymodlauncher-bin/AppRun" "${pkgdir}/usr/bin/labymodlauncher"

    desktop=$(find squashfs-root -maxdepth 1 -name '*.desktop' | head -n1)
    if [ -n "${desktop}" ]; then
        install -Dm644 "${desktop}" "${pkgdir}/usr/share/applications/labymodlauncher-bin.desktop"
        sed -i "s|^Exec=.*|Exec=labymodlauncher %U|; s|^Icon=.*|Icon=labymodlauncher-bin|"             "${pkgdir}/usr/share/applications/labymodlauncher-bin.desktop"
    fi
    icon=$(find squashfs-root -maxdepth 1 -name '*.png' | head -n1)
    [ -z "${icon}" ] && [ -f squashfs-root/.DirIcon ] && icon=squashfs-root/.DirIcon
    if [ -n "${icon}" ]; then
        install -Dm644 "${icon}" "${pkgdir}/usr/share/pixmaps/labymodlauncher-bin.png"
    fi
}
