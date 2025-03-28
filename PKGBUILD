# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=typstyle
pkgver=0.13.2
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Enter-tainer/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
optdepends=("typst: For typst compilation")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b40fea5ac607ab9613a2640ae1a6a017bb41f753c4cfadd236cfffe37f0fa86')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=completion

    mkdir -p "completions"
    for shell in bash zsh fish; do
        "target/release/$pkgname" completions $shell >"completions/$pkgname-completion.$shell"
    done
}

package() {
    install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$pkgname-$pkgver/completions/$pkgname-completion.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "$pkgname-$pkgver/completions/$pkgname-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 "$pkgname-$pkgver/completions/$pkgname-completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
