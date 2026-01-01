# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-systemd
pkgver=0.4.7
pkgrel=1
pkgdesc="Systemd service management plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'systemd')
makedepends=('cargo')
install=owlry-plugin-systemd.install
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('28ec839a4bdbfd0d9fdfccc59ea6da020132c76aa26808d7a824bd7e64fa14902911e68f359c631b82adf55dfa9c16f2dc1e07c022800a9811f5e226468b6a4d')

_cratename=owlry-plugin-systemd

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
