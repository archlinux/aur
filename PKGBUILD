# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=exiled-exchange-2-appimage
pkgver=0.16.3
pkgrel=1
pkgdesc="Path of Exile 2 trading app for price checking"
arch=('x86_64')
url="https://kvan7.github.io/Exiled-Exchange-2/download"
license=('MIT')
depends=('alsa-lib' 'cups' 'gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libxt'
         'mesa' 'nss' 'systemd-libs' 'xdg-utils')
optdepends=('libayatana-appindicator: system tray icon')
provides=("exiled-exchange-2=${pkgver}")
conflicts=('exiled-exchange-2' 'exiled-exchange-2-bin')
source=(
    "Exiled-Exchange-2-${pkgver}.AppImage::https://github.com/Kvan7/Exiled-Exchange-2/releases/download/v${pkgver}/Exiled-Exchange-2-${pkgver}.AppImage"
    "exiled-exchange-2.desktop"
    "LICENSE::https://raw.githubusercontent.com/Kvan7/Exiled-Exchange-2/v${pkgver}/LICENSE"
)
sha256sums=('6801c510b7652fb71c729cc05bd44e1c5d616430274064cb2ed0e89d2d024f64'
            'd6fe547e7257e37748c04ab13c81bbfa9ac373b6a0f624de6fc1c0309513da97'
            '5c8de7f881b34dc31f872531a1eee1eabc79e10acd8fc91c026e10c5a8258c3f')
noextract=("Exiled-Exchange-2-${pkgver}.AppImage")
options=('!strip' '!debug')

prepare() {
    chmod +x "Exiled-Exchange-2-${pkgver}.AppImage"
    ./"Exiled-Exchange-2-${pkgver}.AppImage" --appimage-extract
}

package() {
    local instdir="$pkgdir/usr/lib/exiled-exchange-2"

    # Full app tree (bundles its own Electron — no system electron dep needed).
    # chrome-sandbox is left non-setuid: Electron uses the unprivileged
    # user-namespace sandbox on Arch (kernel.unprivileged_userns_clone=1).
    install -dm755 "$instdir"
    cp -a squashfs-root/. "$instdir/"

    # Drop the bundled GTK2-era tray stack (libappindicator/libindicator/libgconf):
    # it links against libgtk-x11-2.0 and can never load on a modern system.
    # Electron uses the system libayatana-appindicator instead (see optdepends).
    rm -f "$instdir/usr/lib/libappindicator.so.1" \
          "$instdir/usr/lib/libindicator.so.7" \
          "$instdir/usr/lib/libgconf-2.so.4"

    # AppImage extraction leaves 700 dirs — make the tree world-readable
    chmod -R a+rX "$instdir"

    # Wrapper: LD_LIBRARY_PATH exposes the bundled libnotify/libXss/libXtst
    # (needed by Electron notifications and the uiohook hotkey module),
    # mirroring what the AppImage's own AppRun does.
    # --ozone-platform=x11 is REQUIRED on Wayland sessions: the overlay
    # machinery (electron-overlay-window X11 attach, XShape click-through)
    # only works as an X11/XWayland client. As a native Wayland client the
    # overlay becomes a separate fullscreen window that swallows all input
    # (setIgnoreMouseEvents is not implemented on Wayland). Note the old
    # ELECTRON_OZONE_PLATFORM_HINT env var is ignored by Electron 40.
    # Upstream awakened-poe-trade applies the same switch by default.
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/exiled-exchange-2" << 'EOF'
#!/bin/bash
exec env LD_LIBRARY_PATH="/usr/lib/exiled-exchange-2/usr/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}" \
    /usr/lib/exiled-exchange-2/exiled-exchange-2 --ozone-platform=x11 "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/exiled-exchange-2"

    # Desktop entry (ours, not the bundled one)
    install -Dm644 exiled-exchange-2.desktop "$pkgdir/usr/share/applications/exiled-exchange-2.desktop"

    # Icons
    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}/apps/exiled-exchange-2.png" \
            "$pkgdir/usr/share/icons/hicolor/${size}/apps/exiled-exchange-2.png"
    done

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
