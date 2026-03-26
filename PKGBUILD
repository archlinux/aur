# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-emoji
pkgver=1.0.0
pkgrel=1
pkgdesc="Emoji picker plugin for Owlry — search and insert emoji characters"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry-plugins"
license=('GPL-3.0-or-later')
depends=('owlry-core' 'wl-clipboard' 'noto-fonts-emoji')
makedepends=('cargo')
install=owlry-plugin-emoji.install
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry-plugins/archive/$pkgname-v$pkgver.tar.gz")
b2sums=('SKIP')

_cratename=owlry-plugin-emoji

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
