# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-filesearch
pkgver=0.4.10
pkgrel=1
pkgdesc="File search plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
install=owlry-plugin-filesearch.install
optdepends=(
    'fd: fast file finding (recommended)'
    'mlocate: locate-based file search'
)
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2d3761ee892d7f283a65fa58ca6206735b1b3b6e7f764f839e8a2cbd2fee2ce446c4b992e664790439393e6cb2f21fb21abacdeaf8de9eca4514da86c608216d')

_cratename=owlry-plugin-filesearch

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p $_cratename --frozen --release
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p $_cratename --frozen
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/plugins/lib${_cratename//-/_}.so"
}
