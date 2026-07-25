# Maintainer: Charlotte <cemetery394@gmail.com>

pkgname=citron-neo-nightly-bin
pkgver=2026.07.25
pkgrel=1
pkgdesc="Nightly build of Citron Neo Nintendo Switch emulator (AppImage)"
arch=('x86_64')
url="https://github.com/citron-neo/CI"
license=('GPL-3.0-or-later')

provides=('citron' 'citron-neo')
conflicts=('citron' 'citron-git' 'citron-neo' 'citron-neo-git' 'citron-neo-bin')

options=(!strip)
depends=('hicolor-icon-theme' 'fuse2' 'qt6-base' 'qt6-webengine')

_commit="e23318de6"
_appimage="citron_nightly-e23318de6-linux-x86_64-use-nopgo.AppImage"

source=("${_appimage}::https://github.com/citron-neo/CI/releases/download/nightly-linux/${_appimage}")
sha256sums=('bf12df39c826f4c5a0f72b6468450352991d43440d53160e6aaf7ed0ad4f5336')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract >/dev/null
}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/citron-neo-nightly" << EOF
#!/bin/sh
exec /opt/${pkgname}/${pkgname}.AppImage "\$@"
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/citron-neo-nightly.desktop" << EOF
[Desktop Entry]
Name=Citron Neo (Nightly)
Exec=/usr/bin/citron-neo-nightly
Icon=citron-neo
Type=Application
Categories=Game;Emulator;
Comment=Nintendo Switch Emulator - Nightly build
EOF

        # Icon
if [ -f AppDir/org.citron_emu.citron.png ]; then
    install -Dm644 AppDir/org.citron_emu.citron.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/citron-neo.png"
    install -Dm644 AppDir/org.citron_emu.citron.png \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/citron-neo.png"
    install -Dm644 AppDir/org.citron_emu.citron.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/citron-neo.png"
fi
}

post_install() { update-mime-database /usr/share/mime &>/dev/null || true; update-desktop-database -q || true; }
post_upgrade() { post_install; }
post_remove() { post_install; }
