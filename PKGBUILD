# Maintainer: jinzhongjia <jinzhongjia@manus.ai>

pkgname=terax
pkgver=0.7.1
pkgrel=1
pkgdesc="Lightweight AI-native terminal emulator (ADE) built with Tauri 2 and React"
arch=('x86_64')
url="https://github.com/crynta/terax-ai"
license=('Apache-2.0')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libsoup3'
    'cairo'
    'glib2'
    'gdk-pixbuf2'
    'libgcc'
    'glibc'
    'hicolor-icon-theme'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'pnpm'
    'pkgconf'
)
optdepends=(
    'mesa: hardware-accelerated rendering'
    'adwaita-icon-theme: fallback icon theme'
)
provides=('terax')
conflicts=('terax-bin')
options=('!lto' '!debug' '!strip')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('79ae8f51add9b57dd00b77d5d3af17881885872ab09ac6088b7f8572bcc88d87')

prepare() {
    cd "${srcdir}/terax-ai-${pkgver}"
    export npm_config_cache="${srcdir}/.npm-cache"

    # @tailwindcss/oxide walks parent dirs to find a .git boundary and
    # then honors that repo's .gitignore. The AUR package repo's
    # .gitignore is `*` (ignore everything but PKGBUILD/.SRCINFO), which
    # silently excludes the entire upstream source tree from utility
    # scanning, producing CSS with zero Tailwind utilities. Plant a
    # local .git marker so oxide stops climbing at this directory.
    mkdir -p .git
    : > .git/HEAD

    pnpm install --frozen-lockfile
}

build() {
    cd "${srcdir}/terax-ai-${pkgver}"
    export npm_config_cache="${srcdir}/.npm-cache"
    pnpm exec tauri build --no-bundle
}

package() {
    cd "${srcdir}/terax-ai-${pkgver}"

    install -Dm755 "src-tauri/target/release/terax" \
        "${pkgdir}/usr/bin/terax"

    local _icondir="${pkgdir}/usr/share/icons/hicolor"
    install -Dm644 "src-tauri/icons/32x32.png"      "${_icondir}/32x32/apps/terax.png"
    install -Dm644 "src-tauri/icons/64x64.png"      "${_icondir}/64x64/apps/terax.png"
    install -Dm644 "src-tauri/icons/128x128.png"    "${_icondir}/128x128/apps/terax.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" "${_icondir}/256x256/apps/terax.png"
    install -Dm644 "src-tauri/icons/icon.png"       "${_icondir}/512x512/apps/terax.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/terax.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Terax
Comment=AI-native terminal emulator
Exec=terax
Icon=terax
Terminal=false
Categories=Development;System;TerminalEmulator;
StartupWMClass=terax
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
