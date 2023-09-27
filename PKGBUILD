# Maintainer: Bennett Petzold <dansecob.aur gmail com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

BUILDENV+=(!check)

pkgname=qsv
pkgver=0.117.0
pkgrel=2
pkgdesc='A command line program for CSV files. Fork of xsv.'
arch=(any)
url='https://github.com/jqnatividad/qsv'
license=(MIT Unlicense)
depends=(python python-xlsxwriter)
makedepends=(cargo clang luau)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5f74e4380a1fea1b2fb8ae41c852f3fcde3021780e2352351ab20869913ac578')

_features='feature_capable,apply,fetch,foreach,generate,luau,polars,python,to,geocode'

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --features "$_features"
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features "$_features"
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
