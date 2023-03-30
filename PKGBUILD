# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Asuka Minato <asukaminato at nyan dot eu dot org>
pkgname=hvm-git
pkgver=r841.5e52131
pkgrel=1
epoch=
pkgdesc="A massively parallel, optimal functional runtime in Rust"
arch=('any')
url="https://github.com/HigherOrderCO/HVM"
license=('MIT')
groups=()
depends=(glibc gcc-libs)
makedepends=(git cargo-nightly)
checkdepends=()
optdepends=()
provides=(hvm)
conflicts=(hvm hvm-bin)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/HigherOrderCO/HVM.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

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

