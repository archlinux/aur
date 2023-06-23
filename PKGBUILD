
# Maintainer: Your Name <youremail@domain.com>
# Contributor: Asuka Minato
pkgname=piano-rs-git
pkgver=v0.1.0.r99.ge7d1163
pkgrel=1
pkgdesc="A multiplayer piano using UDP sockets that can be played using computer keyboard, in the terminal"
arch=('any')
url="https://github.com/ritiek/piano-rs/"
license=('MIT')
depends=(glibc gcc-libs alsa-lib)
makedepends=(git cargo)
source=("git+https://github.com/ritiek/piano-rs.git"
piano-rs.sh)
sha256sums=('SKIP'
            '99d9bea2b2bc084e48a703fc1dad2066e9b419b7869ea69f43d673f3cfae9b45')
pkgver() {
  cd "piano-rs"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    pushd piano-rs
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    pushd piano-rs
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}
check() {
    pushd piano-rs
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
package() {
    install -Dm755 piano-rs.sh $pkgdir/usr/bin/piano-rs
    pushd piano-rs
    install -Dm0755 -t "$pkgdir/opt/$pkgname/" "target/release/piano-rs"
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
    cp -av assets $pkgdir/opt/$pkgname/
}
