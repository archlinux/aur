pkgname=aichat-git
_pkgname=aichat
pkgver=0.8.0.r1.gf257931
pkgrel=1
pkgdesc="Using ChatGPT/GPT-3.5/GPT-4 in the terminal"
arch=('i686' 'x86_64')
url="https://github.com/sigoden/aichat"
license=('MIT' 'APACHE')
makedepends=('git' 'cargo')
conflicts=('aichat' 'aichat-bin')
source=("git+https://github.com/sigoden/aichat")
sha256sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}


build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"

    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
