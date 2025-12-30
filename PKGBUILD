# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-system
pkgver=0.4.5
pkgrel=1
pkgdesc="System actions plugin for Owlry (shutdown, reboot, logout, etc.)"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'systemd')
makedepends=('cargo')
install=owlry-plugin-system.install
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('8d2deb89efb3978ab4c5aa0f7241a586efdfa54a702b885a7d17b1bbac94fb9be8aaf06737a9c7bc9602d7c2fcd19dfbb86ac0333c9bddadf4790983ac93e7cb')

_cratename=owlry-plugin-system

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
