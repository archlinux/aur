# Maintainer: Polarian <polarian@polarian.dev>
# Co-maintainer: Lemon <lemon@lemonsh.moe>

_reponame="chuncord"
pkgname="chuncord-git"
pkgver="0.2.r1.g9ffce3e"
pkgrel=1
pkgdesc="CLI tool that allows for uploading large files to Discord in parts using webhooks"
arch=("x86_64")
url="https://git.lemonsh.moe/lemon/chuncord"
license=("custom:EUPLv1.2")
makedepends=("cargo" "git")
source=("git+https://git.lemonsh.moe/lemon/$_reponame")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$pkgname/LICENSE"
    install -Dm755 "$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
