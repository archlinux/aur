# Maintainer: ldev <ldev dot eu dot org>
pkgver=2.1.0
pkgrel=1

pkgname=git-credential-github
pkgdesc="A simple git credentials helper for github"
license=('MIT')
url="https://github.com/Xgames123/$pkgname"
arch=('any')

binname=git-credential-github
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9536717baacc1def9723b059e3e635dd7d425f5f6e427dc29ba1a89cb92e5250')
conflicts=("git-credential-github-git")
replaces=("gh-login")
makedepends=(
cargo
)
optdepends=(
xdg-utils
wl-clipboard
xclip
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    rm -f Cargo.lock
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch
}


build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$binname"
    ln -s "/usr/bin/$binname" "$pkgdir/usr/bin/git-credential-gh-login"
}
