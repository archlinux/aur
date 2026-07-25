# Maintainer: Zeus-Deus <codemux at codemux dot org>
pkgname=codemux-bin
pkgver=0.15.0
pkgrel=1
pkgdesc="The Agentic Development Environment for Builders"
arch=('x86_64')
url="https://github.com/Zeus-Deus/codemux"
license=('custom:Elastic-2.0')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'openssl' 'git' 'ydotool' 'xdg-utils' 'xdg-desktop-portal' 'xdg-desktop-portal-gtk' 'ripgrep' 'fd' 'github-cli')
optdepends=(
    'chromium: browser panes (or google-chrome, brave)'
    'zenity: file picker fallback when no desktop portal backend is running'
)
provides=('codemux')
conflicts=('codemux')
source=("https://github.com/Zeus-Deus/codemux/releases/download/v${pkgver}/codemux_${pkgver}_amd64.AppImage")
sha256sums=('1fc04209a7feb0001a3924ba94dbae440afd4f94f459db7fe6f58fe5b24d1206')
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

    # Tauri-bundled resources. Two binaries currently live here:
    #   - codemux-claude-sidecar-<triple>: claude-agent sidecar (since
    #     v0.2.0). Shipped as a resource (not externalBin) to avoid
    #     linuxdeploy's patchelf corrupting the bun-compiled ~100 MB
    #     binary. Setup hook in lib.rs pins CODEMUX_CLAUDE_SIDECAR_PATH
    #     from here. Missing → agent-chat Claude provider fails with
    #     `provider_not_configured: Claude` on send.
    #   - codemux-remote-<triple>: daemon scp'd to remote SSH hosts on
    #     first push (since v0.4.0). Resolved at runtime via
    #     AppHandle::path().resource_dir(). Missing → push-to-host
    #     errors out with "Codemux build doesn't include codemux-remote
    #     for x86_64-unknown-linux-gnu".
    # Tauri places resources under /usr/lib/<bundle-name>/ on deb/rpm,
    # which is what resource_dir() returns at runtime.
    if [ -d usr/lib/codemux/binaries ]; then
        install -d "${pkgdir}/usr/lib/codemux/binaries"
        for pattern in codemux-claude-sidecar-* codemux-remote-*; do
            for f in usr/lib/codemux/binaries/$pattern; do
                [ -f "$f" ] || continue
                install -Dm755 "$f" "${pkgdir}/${f}"
            done
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
