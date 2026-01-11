# Maintainer: Chris Pearce <chris@cpearce.me.uk>
pkgname=gkeys-rs-git
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="G-key macro daemon for Logitech keyboards (G815, G915, G910) using hidraw"
arch=('x86_64')
url="https://github.com/csutcliff/gkeys-rs"
license=('GPL-3.0-only')
depends=('gcc-libs')
makedepends=('git' 'cargo' 'rust')
provides=('gkeys-rs')
conflicts=('gkeys-rs')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd gkeys-rs
    printf "%s" "$(git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" || \
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd gkeys-rs
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd gkeys-rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd gkeys-rs
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd gkeys-rs
    install -Dm755 "target/release/gkeys-rs" "$pkgdir/usr/bin/gkeys-rs"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install systemd user service
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/gkeys-rs.service" << 'EOF'
[Unit]
Description=G-Key Macro Daemon for Logitech Keyboards
After=graphical-session.target

[Service]
Type=simple
ExecStart=/usr/bin/gkeys-rs
Restart=on-failure
RestartSec=5
Environment=RUST_LOG=info

[Install]
WantedBy=graphical-session.target
EOF

    # Install udev rules
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/udev/rules.d/99-gkeys.rules" << 'EOF'
# Logitech G815 - hidraw access for gkeys-rs
KERNEL=="hidraw*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33f", MODE="0660", GROUP="input"
# Logitech G915
KERNEL=="hidraw*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c33e", MODE="0660", GROUP="input"
# Logitech G915 TKL
KERNEL=="hidraw*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c343", MODE="0660", GROUP="input"
# Logitech G910 Orion Spark
KERNEL=="hidraw*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c32b", MODE="0660", GROUP="input"
# Logitech G910 Orion Spectrum
KERNEL=="hidraw*", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c335", MODE="0660", GROUP="input"
EOF
}
