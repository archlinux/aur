# Maintainer: simonlinuxcraft <simonlinuxcraft at users dot noreply dot github dot com>
pkgname=kyber-launcher-unofficial-appimage
_pkgname=KyberLinuxPort
_appver=0.1.0-beta.6.4.7
pkgver=0.1.0_beta.6.4.7
pkgrel=1
pkgdesc="Unofficial Linux build of the Kyber mod launcher for Star Wars: Battlefront II (2017). Not endorsed by the Kyber team."
arch=('x86_64')
url="https://github.com/simonlinuxcraft/kyber-linuxport-unofficial"
license=('GPL-3.0-only')
depends=('fuse2' 'libnotify' 'gtk3' 'librsvg' 'nettle3')
optdepends=('zenity: first-start self-install dialog (alternative to kdialog)'
            'kdialog: first-start self-install dialog (alternative to zenity)'
            'gst-plugins-bad: needed for the Origin login splash video in BF2'
            'gst-plugins-ugly: needed for the Origin login splash video in BF2'
            'gst-libav: needed for the Origin login splash video in BF2'
            'vulkan-tools: vulkaninfo, useful for bug reports'
            'gamemode: keeps the CPU governor on performance while BF2 runs')
provides=('kyber-launcher')
replaces=('kyber-launcher-inofficial-appimage')
conflicts=('kyber-launcher-inofficial-appimage')
options=('!strip')
install="${pkgname}.install"
source=("${_pkgname}-${_appver}-x86_64.AppImage::${url}/releases/download/v${_appver}/${_pkgname}-x86_64.AppImage")
sha256sums=('4a51bf7446943a0dce9ddc27c6429e10795fab48485bbc21eb1ff55bf57b355f')
noextract=("${_pkgname}-${_appver}-x86_64.AppImage")

package() {
    # AppImage in /opt/, executable
    install -Dm755 "${srcdir}/${_pkgname}-${_appver}-x86_64.AppImage" \
        "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage"

    # Unpack the squashfs to pull icons + the URL-scheme handlers out of the
    # exact binary we ship. Run the 0755 /opt copy we just installed (the
    # downloaded source carries no executable bit). --appimage-extract is the
    # type-2 runtime self-unpack (no FUSE), safe in the makepkg fakeroot.
    ( cd "${srcdir}" && "${pkgdir}/opt/${pkgname}/${_pkgname}.AppImage" --appimage-extract >/dev/null )
    local _sqfs="${srcdir}/squashfs-root"

    # qrc:// + nxm:// handlers run unmodified from /opt. Both are layout
    # independent: maxima-bootstrap has no RUNPATH and only links system libs;
    # nxm_handler.sh only touches $XDG_RUNTIME_DIR. qrc:// is required for EA
    # login (forwards the OAuth code to the launcher's 127.0.0.1:31033 listener).
    install -Dm755 "${_sqfs}/usr/bin/cli/maxima-bootstrap" \
        "${pkgdir}/opt/${pkgname}/maxima-bootstrap"
    install -Dm755 "${_sqfs}/usr/bin/cli/bin/nxm_handler.sh" \
        "${pkgdir}/opt/${pkgname}/nxm_handler.sh"

    # Icons (10 PNG sizes + scalable SVG), real upstream name kyber-linux.
    local _size _src
    for _size in 16 24 32 48 64 96 128 192 256 512; do
        _src="${_sqfs}/usr/share/icons/hicolor/${_size}x${_size}/apps/kyber-linux.png"
        [ -f "${_src}" ] || continue
        install -Dm644 "${_src}" \
            "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/kyber-linux.png"
    done
    install -Dm644 "${_sqfs}/usr/share/icons/hicolor/scalable/apps/kyber-linux.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/kyber-linux.svg"

    # Wrapper. KYBER_NO_AUTO_INSTALL=1 no-ops the AppImage self-install hook so
    # the pacman /opt copy never duplicates itself into ~/Applications. env -u
    # GIO_MODULE_DIR + __GL_MaxFramesAllowed match the hygiene the hook's .desktop had.
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/kyber-launcher-unofficial" <<EOF
#!/bin/sh
export KYBER_NO_AUTO_INSTALL=1
exec env -u GIO_MODULE_DIR __GL_MaxFramesAllowed=1 \\
    /opt/${pkgname}/${_pkgname}.AppImage "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/kyber-launcher-unofficial"

    # Main menu entry. No MimeType here: AppRun forwards argv to the GUI, which
    # does not deliver qrc/nxm codes - the dedicated handlers below do.
    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Kyber Launcher (unofficial)
GenericName=Star Wars Battlefront II Mod Launcher
Comment=Unofficial Linux port of the Kyber mod launcher for Star Wars: Battlefront II
Exec=kyber-launcher-unofficial %U
Icon=kyber-linux
Terminal=false
Categories=Game;
StartupWMClass=kyber-linux
Keywords=BF2;Battlefront;Kyber;StarWars;
EOF

    # qrc:// OAuth redirect handler (EA login). Basename matches the AppImage
    # self-install hook (kyber-linuxport-qrc.desktop) so a stale ~/.config/
    # mimeapps.list entry from a previous run self-heals onto the /opt copy
    # once the user-level file is gone.
    cat > "${pkgdir}/usr/share/applications/kyber-linuxport-qrc.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Kyber QRC Handler
Comment=Receives qrc:// OAuth redirects for the Kyber EA login flow.
Exec=/opt/${pkgname}/maxima-bootstrap %u
NoDisplay=true
Terminal=false
StartupNotify=false
MimeType=x-scheme-handler/qrc;
EOF

    # nxm:// Nexus Mods download handler. Basename matches the hook.
    cat > "${pkgdir}/usr/share/applications/kyber-linuxport-nxm.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Kyber NXM Handler
Comment=Receives nxm:// links from Nexus Mods and forwards them to the Kyber launcher.
Exec=/opt/${pkgname}/nxm_handler.sh %u
NoDisplay=true
Terminal=false
StartupNotify=false
MimeType=x-scheme-handler/nxm;
EOF
}
