# Maintainer: Colliery <hello@colliery.io>
pkgname=crt-bin
pkgver=0.1.8
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
sha256sums_x86_64=('2d86714ea24ade50c462a49c65afa6b51580854dac138e8f23695d2d66ae32e0')
sha256sums_aarch64=('33bfee23f3b5dd4ff94e2623fd132d6f091c7ed82e643d61d6e4faae342182d9')

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
