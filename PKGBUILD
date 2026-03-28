# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-websearch
pkgver=1.0.2
pkgrel=1
pkgdesc="Web search plugin for Owlry — search DuckDuckGo, Google, and custom engines"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
install=owlry-plugin-websearch.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('ce86d6ca5cfb8ce6b57bd998fe2e6c242d2e09f147f3d97bd2de5eedbfd4d081f7bb196d930da8d7158a07771b5b3b6e3e29fe79726c248d30c5a494e1bf63dd')

_cratename=owlry-plugin-websearch

prepare() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p $_cratename --frozen --release
}

check() {
    cd "owlry-plugins"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p $_cratename --frozen
}

package() {
    cd "owlry-plugins"
    install -Dm755 "target/release/lib${_cratename//-/_}.so" \
        "$pkgdir/usr/lib/owlry/plugins/lib${_cratename//-/_}.so"
}
