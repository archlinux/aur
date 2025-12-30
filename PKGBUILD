# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-bookmarks
pkgver=0.1.0
pkgrel=1
pkgdesc="Browser bookmarks plugin for Owlry (Firefox, Chrome, Chromium)"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
optdepends=(
    'firefox: Firefox bookmarks support'
    'chromium: Chromium bookmarks support'
    'google-chrome: Chrome bookmarks support'
)
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('SKIP')

_cratename=owlry-plugin-bookmarks

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
        "$pkgdir/usr/lib/owlry/plugins/libbookmarks.so"
}
