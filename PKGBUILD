# Maintainer: Zeus-Deus <codemux at codemux dot org>
pkgname=codemux-bin
pkgver=0.1.29
pkgrel=1
pkgdesc="The Agentic Development Environment for Builders"
arch=('x86_64')
url="https://github.com/Zeus-Deus/codemux"
license=('custom:Elastic-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl' 'git' 'ydotool' 'xdg-utils' 'ripgrep' 'fd' 'github-cli')
optdepends=(
    'chromium: browser panes (or google-chrome, brave)'
    'agent-browser: browser automation CLI (bundled in AppImage, AUR package optional)'
)
provides=('codemux')
conflicts=('codemux')
source=("https://github.com/Zeus-Deus/codemux/releases/download/v${pkgver}/codemux_${pkgver}_amd64.AppImage")
sha256sums=('573b487a643487bf3cce5324b56714745cced44f9fe66964efd35dcdb852b8b3')
options=('!strip')

prepare() {
    chmod +x "${srcdir}/codemux_${pkgver}_amd64.AppImage"
    "${srcdir}/codemux_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # Binary
    install -Dm755 usr/bin/codemux "${pkgdir}/usr/bin/codemux"

    # Sidecar: agent-browser binary (bundled in AppImage by Tauri externalBin)
    if [ -f usr/bin/agent-browser-x86_64-unknown-linux-gnu ]; then
        install -Dm755 usr/bin/agent-browser-x86_64-unknown-linux-gnu \
            "${pkgdir}/usr/bin/agent-browser-x86_64-unknown-linux-gnu"
    fi

    # Desktop entry
    install -Dm644 usr/share/applications/codemux.desktop "${pkgdir}/usr/share/applications/codemux.desktop"

    # Icons — install whatever sizes the AppImage ships
    find usr/share/icons -name "*.png" -o -name "*.svg" | while read icon; do
        install -Dm644 "${icon}" "${pkgdir}/${icon}"
    done

    # License
    install -Dm644 "${startdir}/../../LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" 2>/dev/null || true
}
