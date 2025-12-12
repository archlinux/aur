# Maintainer: Sean Fournier <me@seanfournier.com>
# GitHub: https://github.com/WattForce
pkgname=tonneru
pkgver=0.1.2
pkgrel=1
pkgdesc="A TUI-based WireGuard manager with network automation and kill switch"
arch=('x86_64' 'aarch64')
url="https://github.com/wattfource/tonneru"
license=('WTFPL')
depends=('wireguard-tools' 'nftables')
makedepends=('cargo' 'git')
optdepends=(
    'networkmanager: network detection via nmcli'
    'iwd: network detection via iwctl (recommended for Omarchy)'
    'waybar: status bar integration'
    'libnotify: desktop notifications'
)
backup=('etc/sudoers.d/tonneru')
install=tonneru.install
source=("git+https://github.com/wattfource/tonneru.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname"
    
    # Install binary
    install -Dm755 "target/release/tonneru" "$pkgdir/usr/bin/tonneru"
    
    # Install secure helper script (single point of privilege escalation)
    install -Dm755 "packaging/usr/lib/tonneru/tonneru-sudo" \
        "$pkgdir/usr/lib/tonneru/tonneru-sudo"
    
    # Install sudoers file (allows tonneru group to use helper without password)
    install -Dm440 "packaging/sudoers/tonneru" \
        "$pkgdir/etc/sudoers.d/tonneru"
    
    # Install systemd user service
    install -Dm644 "packaging/systemd/tonneru.service" \
        "$pkgdir/usr/lib/systemd/user/tonneru.service"
    
    # Install polkit policy (fallback for systems not using sudoers)
    install -Dm644 "packaging/polkit/com.omarchy.tonneru.policy" \
        "$pkgdir/usr/share/polkit-1/actions/com.omarchy.tonneru.policy"
    
    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install example configs
    install -Dm644 "packaging/waybar/config.jsonc" \
        "$pkgdir/usr/share/doc/$pkgname/examples/waybar-config.jsonc"
    install -Dm644 "packaging/waybar/style.css" \
        "$pkgdir/usr/share/doc/$pkgname/examples/waybar-style.css"
    install -Dm644 "packaging/waybar/tonneru-status.sh" \
        "$pkgdir/usr/share/doc/$pkgname/examples/waybar-tonneru-status.sh"
    install -Dm644 "packaging/hyprland/windowrules.conf" \
        "$pkgdir/usr/share/doc/$pkgname/examples/hyprland-windowrules.conf"
}
