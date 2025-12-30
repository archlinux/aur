# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-bookmarks
pkgver=0.2.2
pkgrel=1
_srcver=0.4.2
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
source=("owlry-$_srcver.tar.gz::$url/archive/v$_srcver.tar.gz")
b2sums=('4d4e6532e134d5cca4079daa610888cf8b05245b93d1b798b9b817dc5a08dc9cc1d3f45598c7736e967865366e5fcf610549fc50256d6875253d60982dfb6fef')

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
