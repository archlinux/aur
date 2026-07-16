# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: RAprogramm <andrey.rozanov.vl@gmail.com>

pkgname=twc-rs
pkgver=4.0.4
pkgrel=1
pkgdesc="Fast CLI and interactive TUI dashboard for managing Timeweb Cloud infrastructure"
arch=(x86_64 aarch64)
url="https://github.com/RAprogramm/twc-rs"
license=(MIT)
depends=(glibc libgcc libgcc_s.so)
makedepends=(cargo)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('df8e87670e6b26b5a9186bd6c2de7486c99e6c53c1af3b3e1cfbb3467cc8654f')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
    "./target/release/$pkgname" completions bash > "$pkgname.bash"
    "./target/release/$pkgname" completions zsh > "$pkgname.zsh"
    "./target/release/$pkgname" completions fish > "$pkgname.fish"
    "./target/release/$pkgname" completions nushell > "$pkgname.nu"
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md README.ru.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$pkgname.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 "$pkgname.nu" -t "$pkgdir/usr/share/nushell/vendor/autoload/"
}

