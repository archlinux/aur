# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname
pkgdesc='Command-line tool for deploying your Neocities site'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.16
pkgrel=1
arch=('any')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6a0f67dff79b8c5427a625b1506568f5c3fac348eedf1e8a63f38d2fd3b4093f')
makedepends=(cargo)
license=('GPL-3.0-or-later')
options=(!lto)

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features --frozen
}

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}
