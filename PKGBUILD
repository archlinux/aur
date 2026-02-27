# Maintainer: stormix <contact@stormix.co>
pkgname=deadlock-modmanager-git
pkgver=0.15.0.r17.g3de7dda
pkgrel=1
pkgdesc="A mod manager for the Valve game Deadlock, built with Tauri (git)"
arch=('x86_64')
url="https://github.com/deadlock-mod-manager/deadlock-mod-manager"
license=('GPL-3.0-only')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libappindicator-gtk3'
    'xdg-utils'
)
makedepends=(
    'git'
    'rustup'
    'nodejs'
    'pnpm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip' '!lto')
source=("${pkgname}::git+https://github.com/deadlock-mod-manager/deadlock-mod-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags --long --abbrev=7 --match 'v[0-9]*' \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    pnpm install --frozen-lockfile
}

build() {
    cd "${srcdir}/${pkgname}/apps/desktop"

    export VITE_API_URL="https://api.deadlockmods.app"
    export VITE_WEB_URL="https://deadlockmods.app"
    export VITE_AUTH_URL="https://auth.deadlockmods.app"

    # Build the binary only — no bundler overhead
    pnpm tauri build --no-bundle
}

package() {
    local _srcroot="${srcdir}/${pkgname}"
    local _tauri="${_srcroot}/apps/desktop/src-tauri"

    # Binary
    install -Dm755 "${_tauri}/target/release/deadlock-mod-manager" \
        "${pkgdir}/usr/bin/deadlock-mod-manager"

    # Icons
    install -Dm644 "${_tauri}/icons/32x32.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/deadlock-mod-manager.png"
    install -Dm644 "${_tauri}/icons/128x128.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/deadlock-mod-manager.png"
    install -Dm644 "${_tauri}/icons/128x128@2x.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/deadlock-mod-manager.png"
    install -Dm644 "${_tauri}/icons/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/deadlock-mod-manager.png"

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/deadlock-mod-manager.desktop" <<EOF
[Desktop Entry]
Name=Deadlock Mod Manager
Comment=A mod manager for the Valve game Deadlock
Exec=deadlock-mod-manager %u
Icon=deadlock-mod-manager
Terminal=false
Type=Application
Categories=Game;Utility;
MimeType=x-scheme-handler/deadlock-mod-manager;x-scheme-handler/deadlock-modmanager;x-scheme-handler/dlmm;
StartupWMClass=deadlock-mod-manager
EOF

    # AppStream metadata
    install -Dm644 "${_tauri}/dev.stormix.deadlock-mod-manager.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/dev.stormix.deadlock-mod-manager.metainfo.xml"
}
