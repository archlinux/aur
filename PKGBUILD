# Maintainer: Bennett Petzold <dansecob.aur gmail com>

pkgname='qsv'
pkgver='0.100.0'
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

md5sums=('e962af37ee6fb6febdf55ff138964c4d'
         'b6ac3fc857e4d2657be8c4e81c86a56c')
sha512sums=('4d0e9b6f12f8398c4daa704cfa73827e5c5fe9e3c23e6d5bbf536c75a080256307c74ba0f92ea04d09ce18dcdf77982bf85822a17508d03f4a2a745e7eaada5c'
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
    cargo build --frozen --release --features all_features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features all_features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -T "scripts/docopt-wordlist.bash" "$pkgdir/usr/share/bash-completion/completions/qsv"
}
