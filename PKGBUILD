# Maintainer: Charlotte <cemetery394@gmail.com>

pkgname=citron-neo-nightly-bin
pkgver=2026.05.19
pkgrel=1
pkgdesc="Nightly build of Citron Neo Nintendo Switch emulator (AppImage)"
arch=('x86_64')
url="https://github.com/citron-neo/CI"
license=('GPL-3.0-or-later')

provides=('citron' 'citron-neo')
conflicts=('citron' 'citron-git' 'citron-neo' 'citron-neo-git' 'citron-neo-bin')

options=(!strip)
depends=('hicolor-icon-theme' 'fuse2' 'qt6-base' 'qt6-webengine')

_commit="c90bfad9c"
_appimage="citron_nightly-c90bfad9c-linux-x86_64.AppImage"

source=("${_appimage}::https://github.com/citron-neo/CI/releases/download/nightly-linux/${_appimage}")
sha256sums=('5108a046893e1421a4aee4a23781934cd17fbbd6eb8221ea9f9a58b6622661e4')

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
    if [ -f squashfs-root/AppImageBuilder/assets/citron.svg ]; then
        install -Dm644 squashfs-root/AppImageBuilder/assets/citron.svg \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/citron-neo.svg"
    fi
}

post_install() { update-mime-database /usr/share/mime &>/dev/null || true; update-desktop-database -q || true; }
post_upgrade() { post_install; }
post_remove() { post_install; }
