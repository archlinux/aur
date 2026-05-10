# Maintainer: Zeus-Deus <codemux at codemux dot org>
pkgname=codemux-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="The Agentic Development Environment for Builders"
arch=('x86_64')
url="https://github.com/Zeus-Deus/codemux"
license=('custom:Elastic-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl' 'git' 'ydotool' 'xdg-utils' 'ripgrep' 'fd' 'github-cli')
optdepends=(
    'chromium: browser panes (or google-chrome, brave)'
)
provides=('codemux')
conflicts=('codemux')
source=("https://github.com/Zeus-Deus/codemux/releases/download/v${pkgver}/codemux_${pkgver}_amd64.AppImage")
sha256sums=('33e81e27a67f260043575394e472bf2f49a38cf9878c3a8093f08a0d0c033239')
options=('!strip')

prepare() {
    chmod +x "${srcdir}/codemux_${pkgver}_amd64.AppImage"
    "${srcdir}/codemux_${pkgver}_amd64.AppImage" --appimage-extract
}

package() {
    cd "${srcdir}/squashfs-root"

    # Main binary
    install -Dm755 usr/bin/codemux "${pkgdir}/usr/bin/codemux"

    # Tauri-bundled externalBin (agent-browser native helper). Tauri's
    # bundler drops the target-triple suffix when staging into deb/rpm,
    # so the file lives at usr/bin/agent-browser (no triple).
    if [ -f usr/bin/agent-browser ]; then
        install -Dm755 usr/bin/agent-browser "${pkgdir}/usr/bin/agent-browser"
    fi

    # Tauri-bundled resources (claude-agent sidecar). Shipped as a
    # resource (not externalBin) starting v0.2.0 to avoid linuxdeploy's
    # patchelf corrupting the bun-compiled ~100 MB binary. Tauri places
    # resources under /usr/lib/<bundle-name>/ on Linux deb/rpm — that's
    # what AppHandle::path().resource_dir() resolves to at runtime, and
    # the setup() hook in lib.rs pins CODEMUX_CLAUDE_SIDECAR_PATH from
    # there. If this directory is missing the agent-chat Claude provider
    # fails with `provider_not_configured: Claude` on send.
    if [ -d usr/lib/codemux/binaries ]; then
        install -d "${pkgdir}/usr/lib/codemux/binaries"
        for f in usr/lib/codemux/binaries/codemux-claude-sidecar-*; do
            [ -f "$f" ] || continue
            install -Dm755 "$f" "${pkgdir}/${f}"
        done
    fi

    # Desktop entry
    install -Dm644 usr/share/applications/codemux.desktop "${pkgdir}/usr/share/applications/codemux.desktop"

    # Icons — install whatever sizes the AppImage ships
    find usr/share/icons -name "*.png" -o -name "*.svg" | while read icon; do
        install -Dm644 "${icon}" "${pkgdir}/${icon}"
    done

    # License
    install -Dm644 "${srcdir}/squashfs-root/usr/share/doc/codemux/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" 2>/dev/null || \
    install -Dm644 "${startdir}/../../LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md" 2>/dev/null || true
}
