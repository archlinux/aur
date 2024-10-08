# Maintainer: Jisu-Woniu <jswn@jswn9945.xyz>
pkgname=typstyle
pkgver=0.11.35
pkgrel=1
pkgdesc="Beautiful and reliable typst code formatter"
arch=("aarch64" "armv7h" "x86_64")
url="https://github.com/Enter-tainer/typstyle"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
optdepends=("typst: For typst compilation")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aac4abdd6d7f24321d34b43b8684bc64dba7faad964a2159fcb8842387de0e87')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=cli,completion

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
