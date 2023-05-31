# Maintainer: Bennett Petzold <dansecob.aur gmail com>

pkgname='qsv'
pkgver='0.105.0'
pkgrel='1'
pkgdesc='A command line program for CSV files. Fork of xsv.'
arch=('any')
url='https://github.com/jqnatividad/qsv'
license=('MIT' 'Unlicense')
depends=('python>=3.8'
         'docopt-wordlist')
makedepends=('cargo')
optdepends=('bash-completion: tab completion for bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'completion.patch')

md5sums=('405d7a9d0ddef504cb5ae6297f161cda'
         'b6ac3fc857e4d2657be8c4e81c86a56c')
sha512sums=('a70f38658388e20595f2648b25018cfb40093fd06c5df2dac1f715a5dc51fd702c248c8fb5846462ffa43cdd2da1fb4a36be2edb6da09e9f80b8ccac4242c4cd'
            '809cd1ad542319a8f98c061b222e386afe90668acdc3b4f9183aa5cb3d3e70548fd72d2a160841072fc6ab29d6cd6d1f6c0596f19451dc21ff63449d00b7d2db')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/completion.patch"
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
    install -Dm0644 -T "scripts/docopt-wordlist.bash" "$pkgdir/usr/share/bash-completion/completions/qsv"
}
