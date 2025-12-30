# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-plugin-systemd
pkgver=0.2.0
pkgrel=1
pkgdesc="Systemd service management plugin for Owlry"
arch=('x86_64')
url="https://somegit.dev/Owlibou/owlry"
license=('GPL-3.0-or-later')
depends=('owlry' 'systemd')
makedepends=('cargo')
source=("owlry-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('03938310a657e1dfac5326cea805264e7c946dbb6df33634da31cfcd4c6712828d70227c6b59c3b3c1ec46e102ecabca30b75d9d5a06b2f7f9a7e3d80d0f8756')

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
        "$pkgdir/usr/lib/owlry/plugins/libsystemd.so"
}
