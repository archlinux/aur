# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-media
pkgver=0.4.4
pkgrel=2
pkgdesc="Media player controls plugin for Owlry (MPRIS)"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'playerctl')
makedepends=('cargo')
install=owlry-plugin-media.install
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('0b89ddf244af91700865bf9598a43502b4113b94e0fe5452e9df77f86437f20621d7b0e42105b18f40b87dc1251e4384f773b88813eb2f3d1ef3b04848753417')

_cratename=owlry-plugin-media

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
        "$pkgdir/usr/lib/owlry/plugins/lib${_cratename//-/_}.so"
}
