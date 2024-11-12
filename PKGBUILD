# Maintainer: VCalV
pkgname=mergiraf
pkgver=0.2.0
pkgrel=3
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats"
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPLv3')
makedepends=('cargo')
checkdepends=('git')
conflicts=("$pkgname-bin")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mergiraf/mergiraf/archive/v$pkgver.tar.gz")
sha512sums=('88ff389b4441986430cbf4c8ee32d4cf51f7339864a323532870ef836c9f5ff51f35d8b0ecc02b20647003277e398227500b301ff589d5416821e8d6a9e10bbf')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}


package() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable 
    #cargo install --no-track --frozen --all-features --root "$pkgdir/usr/" --path .
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm444 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm444 GOVERNANCE.md "$pkgdir/usr/share/doc/$pkgname/GOVERNANCE.md"
}
