# Maintainer: bop contributors
pkgname=bop
pkgver=0.1.0
pkgrel=1
pkgdesc='Battery Optimization Project - hardware-aware power tuning for Linux laptops'
arch=('x86_64')
url='https://github.com/yv-was-taken/bop'
license=('MIT')
depends=('iw')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yv-was-taken/bop/archive/v$pkgver.tar.gz")
sha256sums=('949af27b1696d0188fd97942b18caf5652d49898aebcb1ff855b261f4e103c4b')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    cargo run --frozen --bin manpage
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/bop" "$pkgdir/usr/bin/bop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Man pages
    for f in man/*.1; do
        install -Dm644 "$f" "$pkgdir/usr/share/man/man1/$(basename $f)"
    done

    # Generate and install shell completions
    "$pkgdir/usr/bin/bop" completions bash > bop.bash 2>/dev/null || true
    "$pkgdir/usr/bin/bop" completions zsh > _bop 2>/dev/null || true
    "$pkgdir/usr/bin/bop" completions fish > bop.fish 2>/dev/null || true

    [ -s bop.bash ] && install -Dm644 bop.bash "$pkgdir/usr/share/bash-completion/completions/bop"
    [ -s _bop ] && install -Dm644 _bop "$pkgdir/usr/share/zsh/site-functions/_bop"
    [ -s bop.fish ] && install -Dm644 bop.fish "$pkgdir/usr/share/fish/vendor_completions.d/bop.fish"
}
