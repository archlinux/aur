# Maintainer: Bennett Petzold <dansecob.aur gmail com>

pkgname='qsv'
pkgver='0.113.0'
pkgrel='1'
pkgdesc='A command line program for CSV files. Fork of xsv.'
arch=('any')
url='https://github.com/jqnatividad/qsv'
license=('MIT' 'Unlicense')
depends=('python>=3.8')
makedepends=('cargo')
optdepends=('bash-completion: tab completion for bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")

md5sums=('e76c70da7f2cf661ddecb3fd37269546')
sha512sums=('d817983308328d719f42cca06b5478b343348148306983cb8b730c716c4eadfbf87cae9f9f4792e3cb35342b0c419c953466cf6da58cf2cbb1d73c018bb4dd80')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --features feature_capable,apply,fetch,foreach,generate,luau,polars,python,to
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features feature_capable,apply,fetch,foreach,generate,luau,polars,python,to
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
