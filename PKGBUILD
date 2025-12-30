# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-rune
pkgver=0.4.6
pkgrel=1
pkgdesc="Rune runtime for Owlry - enables loading user-created Rune plugins"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry')
makedepends=('cargo')
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('1709b59aa8e2e3abefa875fca63ccf1aa1f6e41473e9eecdce2a88bfa44590c8fd3cb0a64a3d21dff1420d414e7d37924992bf303d9e720da3ff364c9350cc2a')

_cratename=owlry-rune

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
        "$pkgdir/usr/lib/owlry/runtimes/librune.so"
}
