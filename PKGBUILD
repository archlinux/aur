# Maintainer: Good Vibes <good_vibes@fastmail.com>
pkgname=ch57x-keyboard-tool
pkgver=1.6.2
pkgrel=1
pkgdesc="Command-line tool for programming ch57x and ch55x macro keyboards like ch552 or ch552g"
arch=('x86_64' 'aarch64')
url="https://github.com/kriomant/ch57x-keyboard-tool"
license=('MIT' 'Apache-2.0')
depends=('libusb')
makedepends=('cargo')
keywords=('keyboard' 'macro' 'keypad' 'ch57x' 'ch55x' 'ch552' 'ch552g' 'ch554' 'hotkey' 'aliexpress')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kriomant/ch57x-keyboard-tool/archive/refs/tags/v$pkgver.tar.gz"
        "50-ch57x-keyboard.rules")
sha256sums=('bd8ba2b59987a29d4ad4afcdf90b79d54d200d3ab803711d28851222f81bbfb5'
            '26de73e625f2ce8d3b1f753378a40f754c1c69e32e71900fd0e9298ee792075f')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 example-mapping.yaml "$pkgdir/usr/share/doc/$pkgname/example-mapping.yaml"

    # Install udev rules for non-root access
    install -Dm644 "$srcdir/50-ch57x-keyboard.rules" "$pkgdir/usr/lib/udev/rules.d/50-ch57x-keyboard.rules"
}
