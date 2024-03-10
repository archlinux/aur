# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname
pkgdesc='Command-line tool for deploying your Neocities site'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.11
pkgrel=4
arch=('any')
source=("$_pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a8fee770fba94a75e34936056adead6b15b50c28f178d0aee7143e0bf55ff67')
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
