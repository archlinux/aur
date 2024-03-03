# Maintainer: André Kugland <kugland@gmail.com>

pkgname=neocities-deploy
pkgdesc='A command-line tool for deploying your Neocities site. It can upload files to your site, list remote files, and more.'
url='https://github.com/kugland/neocities-deploy'
pkgver=0.1.9
pkgrel=1
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kugland/neocities-deploy/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('94036e811d81ca536f33d725711676b834ed6bc1c8abe6f3a37cda6a54c02939')
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
    install -Dm0644 -t "$pkgdir/usr/doc/$pkgname/" README.md
}
