# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-ssh
pkgver=0.1.0
pkgrel=1
pkgdesc="SSH host launcher plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'openssh')
makedepends=('cargo')
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('SKIP')

_cratename=owlry-plugin-ssh

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
        "$pkgdir/usr/lib/owlry/plugins/libssh.so"
}
