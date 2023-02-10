# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=shotman
pkgver=0.4.1
pkgrel=1
pkgdesc="Uncompromising screenshot GUI for Wayland"
arch=("x86_64" "aarch64")
url="https://git.sr.ht/~whynothugo/shotman"
license=('ISC')
depends=("libxkbcommon")
optdepends=(
    "sway: screenshots of a single window on swaywm"
    "slurp: screenshots of a region on swaywm"
)
makedepends=("git" "cargo" "scdoc")
source=("shotman-${pkgver}::git+https://git.sr.ht/~whynothugo/shotman#tag=v${pkgver}?signed")
sha512sums=("SKIP")
validpgpkeys=("1204CA9FC2FFADEEDC2961367880733B9D062837")

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
    scdoc < shotman.1.scd > shotman.1
    ./target/release/shotman_completions bash > $pkgname.bash
    ./target/release/shotman_completions fish > $pkgname.fish
    ./target/release/shotman_completions zsh > $pkgname.zsh
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 shotman.1 "$pkgdir/usr/share/man/man1/$pkgname.1"

    install -Dm644 $pkgname.bash \
      "$pkgdir"/usr/share/bash-completion/completions/$pkgname
    install -Dm644 $pkgname.fish \
      "$pkgdir"/usr/share/fish/completions/$pkgname.fish
    install -Dm644 $pkgname.zsh \
      "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
}
