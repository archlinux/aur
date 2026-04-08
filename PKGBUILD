# Maintainer: SergBrowns <https://github.com/SergBrowns>
pkgname=phantom-browser-bin
pkgver=155.6.1
pkgrel=1
pkgdesc="Privacy-focused Firefox fork with built-in DPI bypass, VPN (VLESS+REALITY), RKN blocklist sync and ad blocker"
arch=('x86_64')
url="https://github.com/SergBrowns/phantom-browser"
license=('MPL-2.0')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss' 'mime-types')
optdepends=(
    'sing-box: built-in VPN support (VLESS+REALITY)'
    'ffmpeg: H264/AAC media playback'
    'hunspell: spell checking'
    'libnotify: desktop notifications'
    'pipewire: audio support'
    'xdg-desktop-portal: screen sharing (Wayland)'
)
provides=('phantom-browser')
conflicts=('phantom-browser')

source_x86_64=("phantom-${pkgver}.tar.xz::https://github.com/SergBrowns/phantom-browser/releases/download/v${pkgver}/phantom-${pkgver}.tar.xz")
sha256sums_x86_64=('aa927d815053ed23a8d951075f14cc226754ebf4422e99f7f7c1bff2ca4afbdf')

package() {
    # Install browser files
    install -d "${pkgdir}/opt/phantom"
    cp -r phantom/* "${pkgdir}/opt/phantom/"
    chmod +x "${pkgdir}/opt/phantom/phantom"

    # Wrapper script — suppresses console output, sets MOZ_APP_LAUNCHER
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/phantom" <<'WRAPPER'
#!/bin/sh
exec /opt/phantom/phantom "$@" >/dev/null 2>&1
WRAPPER
    ln -s /usr/bin/phantom "${pkgdir}/usr/bin/phantom-browser"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/phantom-browser.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Phantom Browser
GenericName=Web Browser
Comment=Privacy-focused browser with DPI bypass and built-in VPN
Exec=phantom %u
Icon=phantom-browser
Terminal=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
Categories=Network;WebBrowser;
Keywords=Internet;WWW;Browser;Web;Privacy;VPN;DPI;
StartupNotify=true
StartupWMClass=phantom-default
X-KDE-Wayland-AppId=phantom-default
DESKTOP

    # Icons
    for size in 16 32 48 64 128 256 512; do
        local icon="phantom/browser/chrome/icons/default/default${size}.png"
        if [ -f "$icon" ]; then
            install -Dm644 "$icon" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/phantom-browser.png"
        fi
    done
}
