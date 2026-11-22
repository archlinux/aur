# Maintainer: steffeno <https://aur.archlinux.org/account/steffeno>

pkgname=tola
pkgver=0.8.2
pkgrel=1
pkgdesc="Typst-based static site generator: your whole site is one Typst program"
arch=('x86_64' 'aarch64')
url="https://github.com/tola-rs/tola-ssg"
license=('MIT')
depends=('glibc' 'libgcc' 'zlib')
makedepends=('cargo' 'perl')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c243d79488ffec4cb492c9ab97f9a6ee195f4316972745a3b9f815530d8506d7')

prepare() {
    cd "tola-ssg-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "tola-ssg-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p tola
}

check() {
    cd "tola-ssg-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen -p tola
}

package() {
    cd "tola-ssg-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

    local _tola="target/release/$pkgname"
    install -dm0755 \
        "$pkgdir/usr/share/bash-completion/completions" \
        "$pkgdir/usr/share/zsh/site-functions" \
        "$pkgdir/usr/share/fish/vendor_completions.d" \
        "$pkgdir/usr/share/elvish/lib" \
        "$pkgdir/usr/share/man/man1"

    "$_tola" completions bash   > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$_tola" completions zsh    > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$_tola" completions fish   > "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    "$_tola" completions elvish > "$pkgdir/usr/share/elvish/lib/$pkgname.elv"
    "$_tola" manpage --output "$pkgdir/usr/share/man/man1/$pkgname.1"
}
