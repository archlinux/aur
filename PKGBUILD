# Maintainer: Craig McLure <craig@mclure.net>
pkgname=goxlr-utility
pkgver=0.11.0
pkgrel=3
pkgdesc="A utility for monitoring and controlling a TC-Helicon GoXLR or GoXLR Mini."
arch=('x86_64')
url="https://github.com/GoXLR-on-Linux/goxlr-utility"
license=('MIT' 'custom')
depends=('libusb' 'bzip2' 'libpulse' 'speech-dispatcher')
makedepends=('cargo' 'jq' 'pkgconf' 'clang')
install=goxlr-utility.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoXLR-on-Linux/goxlr-utility/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('09e7dd106a9cf6b37f0b63e48294e26a41c4d91d225045d1662b840c77bdc5d3c8c3f1aeb225fd5b964f2d1bf588ff59ede3e369ee06711702e933cf4795f70d')

prepare() {
    cd "$pkgname-$pkgver"

    # Don't lock the fetch, Cargo.lock isn't present in the repository
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}

build() {
    cd "$pkgname-$pkgver"

    # Based on the ripgrep build
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --all-features --release --frozen --message-format=json-render-diagnostics |
    jq -r 'select(.out_dir) | select(.package_id | startswith("goxlr-client")) | .out_dir' > out_dir
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    local OUT_DIR=$(<out_dir)

    install -Dm755 "target/release/goxlr-daemon" "$pkgdir/usr/bin/goxlr-daemon"
    install -Dm755 "target/release/goxlr-client" "$pkgdir/usr/bin/goxlr-client"
    install -Dm755 "target/release/goxlr-defaults" "$pkgdir/usr/bin/goxlr-defaults"
    install -Dm755 "target/release/goxlr-launcher" "$pkgdir/usr/bin/goxlr-launcher"
    install -Dm755 "target/release/goxlr-firmware" "$pkgdir/usr/bin/goxlr-firmware"

    install -Dm644 "50-goxlr.rules" "$pkgdir/etc/udev/rules.d/50-goxlr.rules"

    install -Dm644 "daemon/resources/goxlr-utility.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/goxlr-utility.png"
    install -Dm644 "daemon/resources/goxlr-utility.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/goxlr-utility.svg"
    install -Dm644 "daemon/resources/goxlr-utility-large.png" "$pkgdir/usr/share/pixmaps/goxlr-utility.png"
    install -Dm644 "daemon/resources/goxlr-utility.desktop" "$pkgdir/usr/share/applications/goxlr-utility.desktop"

    install -Dm644 "$OUT_DIR/goxlr-client.bash" "$pkgdir/usr/share/bash-completions/goxlr-client.bash"
    install -Dm644 "$OUT_DIR/goxlr-client.fish" "$pkgdir/usr/share/fish/vendor_completions.d/goxlr-client.fish"
    install -Dm644 "$OUT_DIR/_goxlr-client" "$pkgdir/usr/share/zsh/vendor-completions/_goxlr-client"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "LICENSE-3RD-PARTY" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-3RD-PARTY"

}

