# Maintainer: Colliery <hello@colliery.io>
pkgname=crt-bin
pkgver=0.0.10
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator with CSS theming and visual effects"
arch=('x86_64' 'aarch64')
url="https://github.com/colliery-io/crt"
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland' 'libx11' 'vulkan-icd-loader' 'hicolor-icon-theme')
optdepends=('vulkan-driver: for Vulkan rendering backend')
provides=('crt')
conflicts=('crt' 'crt-git')
source_x86_64=("crt-${pkgver}-linux-x86_64.tar.gz::https://github.com/colliery-io/crt/releases/download/v${pkgver}/crt-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("crt-${pkgver}-linux-aarch64.tar.gz::https://github.com/colliery-io/crt/releases/download/v${pkgver}/crt-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('a739c7228440b23df819faee53463239a6e28f8360089b2557f2939b02e0a663')
sha256sums_aarch64=('565c2f9fce1689f2203b0060da1313a4a44f5c23999b546d96723eee7673b67b')

package() {
    # Install binary
    install -Dm755 crt "$pkgdir/usr/bin/crt"

    # Install assets to share directory
    install -dm755 "$pkgdir/usr/share/crt"
    if [ -d "assets" ]; then
        cp -r assets/* "$pkgdir/usr/share/crt/"
    fi

    # Install desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/crt.desktop" <<EOF
[Desktop Entry]
Name=CRT
Comment=GPU-accelerated terminal with CSS theming and visual effects
Exec=crt
Icon=crt
Type=Application
Categories=System;TerminalEmulator;
Keywords=terminal;console;gpu;
Terminal=false
EOF

    # Install icons
    for size in 16 32 48 64 128 256; do
        if [ -f "assets/icons/crt-${size}x${size}.png" ]; then
            install -Dm644 "assets/icons/crt-${size}x${size}.png" \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/crt.png"
        fi
    done

    # Install license
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<EOF
CRT is dual-licensed under MIT and Apache-2.0.
See https://github.com/colliery-io/crt for full license texts.
EOF
}
