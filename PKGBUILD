# Maintainer: André Kugland <kugland@gmail.com>

pkgname=neocities-deploy
pkgdesc='A command-line tool for deploying your Neocities site. It can upload files to your site, list remote files, and more.'
url='https://github.com/kugland/neocities-deploy'
pkgver=0.1.8
pkgrel=1
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kugland/neocities-deploy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8b7c5a03dd39feb1a5062deda09fce127bdde4a242236b0be4f6d935446b4ce4')
makedepends=(cargo)
license=('GPL3')
options=(!lto)

prepare() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features --frozen
}

check() {
    cd "$srcdir/neocities-deploy-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features --frozen
}

package() {
    cd "$srcdir/neocities-deploy-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
