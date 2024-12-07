# Maintainer: VCalV
pkgname=mergiraf
pkgver=0.3.1
pkgrel=2
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats"
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPL-3.0-or-later')
makedepends=('cargo')
checkdepends=('git')
depends=(glibc gcc-libs)
options=('!lto')
conflicts=("$pkgname-bin" "$pkgname-git")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mergiraf/mergiraf/archive/v$pkgver.tar.gz")
sha512sums=('7d5733517db1f1599399ebb2f665f228ea56ec7b52373644c18312ab3ea3285b44de664f798c00ce9fe77f3cc72422b490f6251dba1fb3466b4a8d5e5050c27b')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    #cargo update
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
    #cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    cargo install --no-track --offline --all-features --root "$pkgdir/usr/" --path .
    install -Dm444 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm444 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm444 GOVERNANCE.md "$pkgdir/usr/share/doc/$pkgname/GOVERNANCE.md"
}
