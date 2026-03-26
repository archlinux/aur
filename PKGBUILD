# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-websearch
pkgver=1.0.1
pkgrel=1
pkgdesc="Web search plugin for Owlry — search DuckDuckGo, Google, and custom engines"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core')
makedepends=('cargo')
install=owlry-plugin-websearch.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('1ae495d6dc9dce479f9676b4bfddc410bfc9be0f3f6b99f0626f007e15de55a52c4630a3facdb9671d0aaef61d30ab1fc27401476c6934371d68da6000e7e1a9')

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
