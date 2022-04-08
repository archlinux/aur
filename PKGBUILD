# Maintainer: Joshua Smith <jsmithfpv@disroot.org>

pkgname=peep-git
_pkgname=${pkgname%-git}
pkgver=0.1.4.r21.g0eceafe
pkgrel=1
pkgdesc="The CLI text viewer that works like less on a small pane within the terminal window"
url="https://github.com/ryochack/peep"
arch=('x86_64')
license=('MIT')
makedepends=('cargo' 'git')
provides=("$_pkgname=$pkgver")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
    cd $_pkgname
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd $_pkgname
    git describe --long --tags --abbrev=7 --match='v[0-9]*' |
        sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $_pkgname
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $_pkgname
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE

}
