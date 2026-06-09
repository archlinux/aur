
pkgname=labymodlauncher-bin
pkgver=3.0.7
pkgrel=1
pkgdesc="A launcher for LabyMod, a Minecraft client that adds a bunch of useful features (official)"
arch=('x86_64')
url="https://www.laby.net/"
license=('LicenseRef-Proprietary')
provides=('labylauncher')
depends=('gtk3' 'nss' 'alsa-lib')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-3.0.7.AppImage")
sha256sums=('b8c1691624b011a36fe2b1f16d57979c1ff3332f341732ea6c029981fc1df8b1')

package() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null

    install -dm755 "${pkgdir}/opt/labymodlauncher-bin"
    cp -a squashfs-root/. "${pkgdir}/opt/labymodlauncher-bin/"
    chmod 755 "${pkgdir}/opt/labymodlauncher-bin"

    install -dm755 "${pkgdir}/usr/bin"
    printf '%s\n'         '#!/bin/sh'         'export APPDIR=/opt/labymodlauncher-bin'         'export LD_LIBRARY_PATH="${APPDIR}/usr/lib:${LD_LIBRARY_PATH}"'         'export XDG_DATA_DIRS="${APPDIR}/usr/share/:${XDG_DATA_DIRS}:/usr/share/gnome:/usr/local/share/:/usr/share/"'         'export GSETTINGS_SCHEMA_DIR="${APPDIR}/usr/share/glib-2.0/schemas:${GSETTINGS_SCHEMA_DIR}"'         'exec "${APPDIR}/labymodlauncher" "$@"'         > "${pkgdir}/usr/bin/labymodlauncher"
    chmod 755 "${pkgdir}/usr/bin/labymodlauncher"

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
