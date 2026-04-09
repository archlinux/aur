# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-rune
pkgver=1.1.5
pkgrel=1
pkgdesc="Rune scripting runtime for Owlry — enables user-created Rune plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
optdepends=('owlry-core: daemon that loads this runtime')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-rune-v$pkgver.tar.gz")
b2sums=('6bd1b55d55e209e9dbbbf31101521a43e2a3bce465c16098d0aca5d781dffa955251583c6748bcb5f79b135f3d0774cb1d48ac6113ffc9ed06f8f95ef87446fc')

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
