
# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
# Contributor: Asuka Minato
pkgname=hvm-git
pkgver=r841.5e52131
pkgrel=1
pkgdesc="A massively parallel, optimal functional runtime in Rust"
arch=('any')
url="https://github.com/HigherOrderCO/HVM"
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(git cargo-nightly)
provides=(hvm)
conflicts=(hvm hvm-bin)
source=("git+https://github.com/HigherOrderCO/HVM.git")
sha256sums=('SKIP')

pkgver(){
    cd $srcdir/HVM
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    pushd HVM
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    pushd HVM
    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    pushd HVM
    export RUSTUP_TOOLCHAIN=nightly
    cargo test --frozen --all-features # it failed, so if you want to install it, skip the test. Since it's not production ready by its readme.
}

package() {
    pushd HVM
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/hvm"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

