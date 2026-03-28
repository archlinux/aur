# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-rune
pkgver=1.1.1
pkgrel=1
pkgdesc="Rune scripting runtime for Owlry — enables user-created Rune plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-rune-v$pkgver.tar.gz")
b2sums=('a0e1fa032db8dda8e6bc24457f3c04948129d3f14c1d3e61b8e080340b24f560d43294beb133ad4b1c6eb7942d401108ea91c367b074eaeeefa284e9b2a9dbc8')

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
