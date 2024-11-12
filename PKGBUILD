# Maintainer: VCalV
pkgname=mergiraf
pkgver=0.3.0
pkgrel=1
pkgdesc="A syntax-aware git merge driver for a growing collection of programming languages and file formats"
arch=('x86_64')
url="https://mergiraf.org/"
license=('GPLv3')
makedepends=('cargo')
checkdepends=('git')
conflicts=("$pkgname-bin")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/mergiraf/mergiraf/archive/v$pkgver.tar.gz")
sha512sums=('1fc79bf8ffb39cbcae11a038cfb9661dec86daf7f31970d893eb83d5d27371eee0c9d5bfedc9029548ed06bd6f7a586abb175abf99ce2880cbfe222c5465bfc5')

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
