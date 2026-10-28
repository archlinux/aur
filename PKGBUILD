# Maintainer: Ackerman
pkgname=rootapp-bin
pkgver=0.9.156
pkgrel=3
pkgdesc="Root App is a new Discord alternative, designed for gaming communities and large online groups"
arch=('x86_64')
url="https://www.rootapp.com"
license=('LicenseRef-proprietary')
# depends: DT_NEEDED of all 18 ELFs plus by-name dlopen probes, resolved in core+extra (2026-10-28).
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'gtk3'
         'hicolor-icon-theme'
         'krb5'
         'libcups'
         'libglvnd'
         'libice'
         'libpipewire'
         'libpulse'
         'libsm'
         'libva'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxcursor'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxi'
         'libxinerama'
         'libxkbcommon'
         'libxkbcommon-x11'
         'libxrandr'
         'libxss'
         'libxt'
         'libxtst'
         'mesa'
         'nspr'
         'nss'
         'openssl'
         'pango'
         'pciutils'
         'systemd-libs'
         'vulkan-icd-loader'
         'wayland'
         'xdg-utils')
provides=('rootapp')
conflicts=('rootapp')
options=('!strip' '!debug')

source=("Root-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage"
        'LICENSE')
sha256sums=('827f991a6b4b94c3c07dc7403b7dd6fbceff353e787e4c5967772a30021cdcb0'
            '8826596bcd18e3b9019b7bc065a0d22429e7447b2940c64ce500c22c7746a93e')
prepare() {
    chmod +x "${srcdir}/Root-${pkgver}-x86_64.AppImage"
    "${srcdir}/Root-${pkgver}-x86_64.AppImage" --appimage-extract
    chmod go-w squashfs-root

    shipped=$(sed -n 's/^X-AppImage-Version=//p' "${srcdir}"/squashfs-root/*.desktop | head -n 1)
    if [ "$shipped" != "$pkgver" ]; then
        printf 'payload is version %s, pkgver is %s\n' "${shipped:-unknown}" "$pkgver" >&2
        return 1
    fi
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    chmod 755 "${pkgdir}/opt/${pkgname}/AppRun"

    rm -f "${pkgdir}/opt/${pkgname}/usr/bin/Root.dbg"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/rootapp" <<'WRAPPER_EOF'
#!/bin/sh
export APPDIR="/opt/rootapp-bin"
exec /opt/rootapp-bin/AppRun "$@"
WRAPPER_EOF
    chmod 755 "${pkgdir}/usr/bin/rootapp"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/pixmaps/rootapp.png"
    install -Dm644 "${srcdir}/squashfs-root/Root.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rootapp.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rootapp-app.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Root
Comment=Root App is a new Discord alternative, designed for gaming communities and large online groups
Exec=rootapp %U
Icon=rootapp
Terminal=false
StartupWMClass=Root
Categories=Network;InstantMessaging;
MimeType=x-scheme-handler/rootapp;
EOF
}
