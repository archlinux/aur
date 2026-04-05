# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-rune
pkgver=1.1.3
pkgrel=1
pkgdesc="Rune scripting runtime for Owlry — enables user-created Rune plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-rune-v$pkgver.tar.gz")
b2sums=('3dd1db5783b0e0c814f8e6064fd5d8cb736da5bd4759d648f48ea69a476451f64d27ecd0894378f3e41e7cc85557b7d9dcb0adf80114c32e561d4688aae6bb53')

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
