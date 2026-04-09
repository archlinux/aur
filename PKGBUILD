# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-lua
pkgver=1.1.5
pkgrel=1
pkgdesc="Lua scripting runtime for Owlry — enables user-created Lua plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'lua54')
optdepends=('owlry-core: daemon that loads this runtime')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-lua-v$pkgver.tar.gz")
b2sums=('be68489a6148ed3fb12c257994d1c1293a82b9cc2dd1f9a86cfdc780d27c0d07ed31b309b1119525880d605910f653ba7c35b49ae0472cb5a944bb39d36ebaa2')

_cratename=owlry-lua

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p $_cratename --frozen --release --no-default-features
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p $_cratename --frozen --no-default-features --lib
}

package() {
    cd "owlry"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/runtimes/liblua.so"
}
