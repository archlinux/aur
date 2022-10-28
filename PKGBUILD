# Maintainer: Bennett Petzold <dansecob.aur gmail com>

pkgname='qsv'
pkgver='0.70.0'
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

md5sums=('e6144dbe53c3c8a11282457fc79df04e'
         'b6ac3fc857e4d2657be8c4e81c86a56c')
sha512sums=('f939b1e14b1ccd6e11a1ab087f7190d869c4dfa07f28a6463ea21778eb74b973a384daa20243affd3f4bc8cf656f76f0e479bea28b577c0c9e89eda9f112a3c5'
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
    cargo build --frozen --release --features all_full
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features all_full
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 -T "scripts/docopt-wordlist.bash" "$pkgdir/usr/share/bash-completion/completions/qsv"
}
