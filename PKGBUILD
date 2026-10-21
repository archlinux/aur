# Maintainer: Zeus-Deus <codemux at codemux dot org>
pkgname=codemux-bin
pkgver=0.25.0
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
sha256sums=('3c133641da8ae3e7df6540c9479c83a8365aac5ca09614b56e582e7b23779524')
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

    # Daemon the remote-tasks feature runs beside codemux (the .deb ships
    # it here too).
    if [ -f usr/bin/codemux-remote ]; then
        install -Dm755 usr/bin/codemux-remote "${pkgdir}/usr/bin/codemux-remote"
    fi

    # Tauri-bundled resources: sidecars, codemux-remote, the addon host
    # and the @cursor/sdk node_modules tree. Tauri places resources under
    # /usr/lib/<bundle-name>/ on deb/rpm, which is what
    # AppHandle::path().resource_dir() returns at runtime. Copy the whole
    # tree so new resources in tauri.conf.json ship without a PKGBUILD
    # change. Missing files break features at runtime, e.g. Claude chat
    # (`provider_not_configured: Claude`), push-to-host, addons, or
    # workflows ("workflow sidecar is missing").
    if [ -d usr/lib/codemux/binaries ]; then
        install -d "${pkgdir}/usr/lib/codemux"
        cp -r --no-preserve=ownership usr/lib/codemux/binaries "${pkgdir}/usr/lib/codemux/"
        # The extracted AppImage tree can be 0700; make it world-readable.
        chmod -R u=rwX,go=rX "${pkgdir}/usr/lib/codemux/binaries"
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
