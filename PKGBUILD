# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-rune
pkgver=1.1.2
pkgrel=1
pkgdesc="Rune scripting runtime for Owlry — enables user-created Rune plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-rune-v$pkgver.tar.gz")
b2sums=('3e790b4aef289b650aa72371a0271636dc0785d25fb33f054f1ab817ace4ffd785561230399903ada2167d800558feb9a8e1147472432eebce6e3e4f33130fef')

_cratename=owlry-rune

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
    cargo test -p $_cratename --frozen --release
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/runtimes/librune.so"
}
