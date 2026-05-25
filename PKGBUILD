# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
pkgname=kyber-launcher-inofficial-appimage
_pkgname=KyberLinuxPort
_appver=0.1.0-beta.6.1
pkgver=0.1.0_beta.6.1
pkgrel=1
pkgdesc="Inofficial Linux build of the Kyber mod launcher for Star Wars: Battlefront II (2017). Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
depends=('fuse2' 'libnotify' 'gtk3' 'librsvg' 'webkit2gtk-4.1')
optdepends=('zenity: first-start self-install dialog (alternative to kdialog)'
            'kdialog: first-start self-install dialog (alternative to zenity)'
            'gst-plugins-bad: needed for the Origin login splash video in BF2'
            'gst-plugins-ugly: needed for the Origin login splash video in BF2'
            'gst-libav: needed for the Origin login splash video in BF2'
            'vulkan-tools: vulkaninfo, useful for bug reports'
            'gamemode: keeps the CPU governor on performance while BF2 runs')
provides=('kyber-launcher')
options=('!strip')
source=("${_pkgname}-${_appver}-x86_64.AppImage::${url}/releases/download/v${_appver}/${_pkgname}-x86_64.AppImage")
sha256sums=('7e19eceef53d5d2f360fe64e3e13be4d2de3eec66d9a4793ed164f33aac37682')
noextract=("${_pkgname}-${_appver}-x86_64.AppImage")

package() {
    # AppImage in /opt/, executable
    install -Dm755 "${srcdir}/${_pkgname}-${_appver}-x86_64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Wrapper script in /usr/bin/ so users can run "kyber-launcher-inofficial"
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/kyber-launcher-inofficial" <<'EOF'
#!/bin/sh
exec /opt/kyber-launcher-inofficial-appimage/KyberLinuxPort.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/kyber-launcher-inofficial"

    # Basic desktop entry. The AppImage's own self-install hook will add a
    # second user-level .desktop on first run; that's harmless (different
    # location, gets refreshed by the AppImage's own update flow).
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Name=Kyber Launcher (inofficial)
Comment=Inofficial Linux port of the Kyber mod launcher for Star Wars: Battlefront II
Exec=kyber-launcher-inofficial %U
Icon=kyber-launcher-inofficial
Terminal=false
Type=Application
Categories=Game;
MimeType=x-scheme-handler/qrc;x-scheme-handler/nxm;
StartupWMClass=kyber_launcher
EOF
}
