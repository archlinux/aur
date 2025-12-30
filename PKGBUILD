# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-filesearch
pkgver=0.4.3
pkgrel=1
pkgdesc="File search plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
optdepends=(
    'fd: fast file finding (recommended)'
    'mlocate: locate-based file search'
)
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('5d4d334d27d8ae5e6f3f295ced22e986ee92e0b2250f7b7480677a70b630742f62b5b95e14c66c51f5deb1ec8abf796afc251094c8060a5075b2334a499628b8')

_cratename=owlry-plugin-filesearch

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
        "$pkgdir/usr/lib/owlry/plugins/libfilesearch.so"
}
