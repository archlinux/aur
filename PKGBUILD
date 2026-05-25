# Maintainer: Kotsasmin <kotsasmin@gmail.com>
pkgname=modiva-launcher-bin
pkgver=1.5.0
pkgrel=3
pkgdesc="The official Modiva Minecraft launcher"
arch=('x86_64')
url="https://modiva-launcher.xyz"
license=('proprietary')
depends=('zlib' 'fuse2' 'hicolor-icon-theme' 'desktop-file-utils')
options=('!strip')
provides=("modiva-launcher")
conflicts=("modiva-launcher")
source=("modiva-launcher-${pkgver}.AppImage::https://github.com/modiva-launchers/modiva-releases/releases/download/v${pkgver}/Modiva.Launcher_${pkgver}_amd64.AppImage"
    "icon.png")
sha256sums=('f3532e024d335ac31e9f2079e91ac96ce9cc21851101b5531e4b97ad872de68f'
            '295812bdd6e56cdd816a1e4c7db8f3803be5da302569b397d662d4c92c81874b')

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"

    install -m755 "modiva-launcher-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/modiva-launcher.AppImage"

    # --- CHANGED: Create a wrapper script instead of a symlink ---
    # This sets LD_PRELOAD to force the app to use the system's wayland libraries ONLY on Wayland
    cat >"${pkgdir}/usr/bin/modiva-launcher" <<EOF
#!/bin/sh
if [ -n "\$WAYLAND_DISPLAY" ]; then
    export LD_PRELOAD="/usr/lib/libwayland-client.so /usr/lib/libwayland-egl.so"
fi
exec /opt/${pkgname}/modiva-launcher.AppImage "\$@"
EOF

    # Make the wrapper executable
    chmod 755 "${pkgdir}/usr/bin/modiva-launcher"
    # -------------------------------------------------------------

    # Extract desktop file and icon
    install -dm755 "${pkgdir}/usr/share/applications"
    cat >"${pkgdir}/usr/share/applications/modiva-launcher.desktop" <<EOF
[Desktop Entry]
Name=Modiva Launcher
Comment=The official launcher for Modiva
Exec=/usr/bin/modiva-launcher
Icon=modiva-launcher
Terminal=false
Type=Application
Categories=Game;
EOF
    # Install local icon
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
    install -m644 "icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/modiva-launcher.png"
}
