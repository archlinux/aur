# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-ssh
pkgver=0.4.9
pkgrel=1
pkgdesc="SSH host launcher plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'openssh')
makedepends=('cargo')
install=owlry-plugin-ssh.install
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('2776afa1c9a4546a4254b6d460d1a7248dc5f36ebe3f94279bfa9632289836265273a5afda2b63346b5f21ac72cb0fb005393b8187cc1d97f15036a02776d266')

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
        "$pkgdir/usr/lib/owlry/plugins/lib${_cratename//-/_}.so"
}
