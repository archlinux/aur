# Maintainer: Craig McLure <craig@mclure.net>
pkgname=goxlr-utility
pkgver=0.3.1
pkgrel=1
pkgdesc="A utility for monitoring and controlling a TC-Helicon GoXLR or GoXLR Mini."
arch=('x86_64')
url="https://github.com/GoXLR-on-Linux/goxlr-utility"
license=('MIT' 'custom')
depends=('libusb' 'bzip2')
makedepends=('cargo' 'jq')
install=goxlr-utility.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/GoXLR-on-Linux/goxlr-utility/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('3003b04e384fab46defc16ca3fcdd88691f8d929facca3e473c12f81c34bf73656c562040991661779813baa63ce5d4f3e6a4447fd9a44aebff964ba414ecc2b')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    # Based on the ripgrep build
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --message-format=json-render-diagnostics |
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

    install -Dm644 "50-goxlr.rules" "$pkgdir/etc/udev/rules.d/50-goxlr.rules"

    install -Dm644 "$OUT_DIR/goxlr-client.bash" "$pkgdir/usr/share/bash-completions/goxlr-client.bash"
    install -Dm644 "$OUT_DIR/goxlr-client.fish" "$pkgdir/usr/share/fish/vendor_completions.d/goxlr-client.fish"
    install -Dm644 "$OUT_DIR/_goxlr-client" "$pkgdir/usr/share/zsh/vendor-completions/_goxlr-client"

    install -Dm644 "ci/distrib/profiles/Default - Red.goxlr" "$pkgdir/usr/share/goxlr/profiles/Default - Red.goxlr"
    install -Dm644 "ci/distrib/profiles/Default - Teal Blue.goxlr" "$pkgdir/usr/share/goxlr/profiles/Default - Teal Blue.goxlr"
    install -Dm644 "ci/distrib/profiles/Default - Vaporwave.goxlr" "$pkgdir/usr/share/goxlr/profiles/Default - Vaporwave.goxlr"
    install -Dm644 "ci/distrib/profiles/Sleep.goxlr" "$pkgdir/usr/share/goxlr/profiles/Sleep.goxlr"

    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "LICENSE-3RD-PARTY" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-3RD-PARTY"

}

