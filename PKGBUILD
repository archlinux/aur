# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-lua
pkgver=1.1.4
pkgrel=1
pkgdesc="Lua scripting runtime for Owlry — enables user-created Lua plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'lua54')
optdepends=('owlry-core: daemon that loads this runtime')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-lua-v$pkgver.tar.gz")
b2sums=('6bd1b55d55e209e9dbbbf31101521a43e2a3bce465c16098d0aca5d781dffa955251583c6748bcb5f79b135f3d0774cb1d48ac6113ffc9ed06f8f95ef87446fc')

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
