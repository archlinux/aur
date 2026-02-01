# Maintainer: Xavrir <xavrir@github.com>
pkgname=tuxtuner
pkgver=2.0.0
pkgrel=1
pkgdesc="System performance control for Linux - CPU threads, GPU modes, and display refresh rates"
arch=('x86_64')
url="https://github.com/Xavrir/tuxtuner"
license=('MIT')
depends=(
    'gtk4'
    'libadwaita'
    'polkit'
    'hyprland'
)
optdepends=(
    'supergfxctl: For GPU mode switching on ASUS laptops'
)
makedepends=(
    'rust'
    'cargo'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Xavrir/$pkgname/archive/v$pkgver.tar.gz"
)
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver/rust"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "rust/target/release/tuxtuner" "$pkgdir/usr/bin/tuxtuner"

    # Install helper script
    install -Dm755 "src/tuxtuner-helper" "$pkgdir/usr/libexec/tuxtuner-helper"

    # Install polkit policy
    install -Dm644 "data/com.github.xavrir.tuxtuner.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.github.xavrir.tuxtuner.policy"

    # Update polkit policy path
    sed -i 's|/usr/local/libexec/tuxtuner-helper|/usr/libexec/tuxtuner-helper|g' \
        "$pkgdir/usr/share/polkit-1/actions/com.github.xavrir.tuxtuner.policy"

    # Install desktop file
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/tuxtuner.desktop" <<EOF
[Desktop Entry]
Name=TuxTuner
Comment=System performance control - CPU, GPU, and display
Exec=tuxtuner
Icon=preferences-system
Terminal=false
Type=Application
Categories=System;Settings;HardwareSettings;
Keywords=cpu;gpu;performance;power;hyprland;refresh;rate;
EOF

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
