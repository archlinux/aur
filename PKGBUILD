# Maintainer: Colliery <hello@colliery.io>
pkgname=crt-bin
pkgver=0.1.7
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
sha256sums_x86_64=('212bf8d3ab98af60c3e242df659f4da4f18f413300adb37437f6b425ff160fac')
sha256sums_aarch64=('ee547af8d4d80e73bf1b4373da3bceccebe7d5850377f9dc5d7c6a423d097a76')

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
