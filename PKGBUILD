# Maintainer: Thomas <thomas at 6f dot io>
pkgname=jujutsu
_pkgname=jj
pkgver=0.2.0
pkgrel=1
makedepends=('cargo-nightly')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="An experimental, Git-compatible DVCS."
url="https://github.com/martinvonz/jj"
license=('Apache-2.0')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
conflicts=('jj')
provides=('jj')
sha256sums=('d657095e89455318951dbc40779b4e065f4376e376f32434f1c19f88c2482739')

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"

    # See comment in build().
    # mkdir completions
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features

    # Apparently this version is so old it doesn't even have completions.
    # "target/release/$_pkgname" debug completion --bash > "completions/$_pkgname.bash"
    # "target/release/$_pkgname" debug completion --fish > "completions/$_pkgname.fish"
    # "target/release/$_pkgname" debug completion --zsh > "completions/_$_pkgname"
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 -t "$pkgdir/usr/bin" "target/release/$_pkgname"

    # TODO: Install "$pkgname/docs".
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

    # See comment in build().
    # install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions" "completions/$_pkgname.bash"
    # install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" "completions/$_pkgname.fish"
    # install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" "completions/_$_pkgname"
}
