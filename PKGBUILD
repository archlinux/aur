# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-websearch
pkgver=0.2.1
pkgrel=1
_srcver=0.4.0
pkgdesc="Web search plugin for Owlry (DuckDuckGo, Google, etc.)"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
source=("owlry-$_srcver.tar.gz::$url/archive/v$_srcver.tar.gz")
b2sums=('3473b6ff157d5c1ff89318d713a54aa9aff3daef531efb28787591c6833c1cc3ae824fd09c6534655f01ef61b538d7ca864f13630121c3f6bc38286c72abfe32')

_cratename=owlry-plugin-websearch

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
        "$pkgdir/usr/lib/owlry/plugins/libwebsearch.so"
}
