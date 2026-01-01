# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-filesearch
pkgver=0.4.8
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
b2sums=('65960b1ebb3a58f7f1b251d64f6958debcf40ac4360c166f277dae3fa2b7f50f669c64c2728ac876fc73d983b39b64736878980ca8d3a4eb5130271ae5445f33')

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
