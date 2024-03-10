# Maintainer: André Kugland <kugland@gmail.com>

_pkgname=neocities-deploy
pkgname=$_pkgname-git
pkgdesc='Command-line tool for deploying your Neocities site'
url="https://github.com/kugland/$_pkgname"
pkgver=0.1.11.r3.g2fd2edc
pkgrel=2
arch=('any')
source=("$_pkgname::git+${url}#branch=master")
sha256sums=('SKIP')
makedepends=(cargo)
license=('GPL-3.0-or-later')
options=(!lto)

prepare() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features --frozen
}

check() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm0644 -t "$pkgdir/usr/doc/$_pkgname/" README.md
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
