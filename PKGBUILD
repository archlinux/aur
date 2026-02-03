# Maintainer: Berk COŞAR <lookmainpoint@gmail.com>
pkgname=panox
pkgver=0.1.0
pkgrel=1
pkgdesc="Modern clipboard manager for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/cosarberk/panox"
license=('MIT')
depends=('gtk4' 'libadwaita' 'gtk4-layer-shell' 'wl-clipboard')
makedepends=('cargo' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cosarberk/panox/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4cffb9599513a2e0690b2a0f656e3985544a789f7639abfac2ea764095d4b2ce')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Binary
    install -Dm755 "target/release/panox" "$pkgdir/usr/bin/panox"

    # Desktop files
    install -Dm644 "data/panox.desktop" "$pkgdir/usr/share/applications/panox.desktop"
    install -Dm644 "data/panox-daemon.desktop" "$pkgdir/etc/xdg/autostart/panox-daemon.desktop"

    # Systemd user service
    install -Dm644 "data/panox-daemon.service" "$pkgdir/usr/lib/systemd/user/panox-daemon.service"

    # Icon
    install -Dm644 "data/icons/panox.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/panox.svg"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # README
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
