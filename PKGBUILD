# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.3.4
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('648171ce688761babb7ada9ec96cb248fab5563cc45599f660f21e166bfb4db689cff22b82f3a1f2ae256dd54fb3d3f4d5a8acaf6a728976d42ee511e1f25e5f')

prepare() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p owlry-core --frozen --release
}

check() {
    cd "owlry"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test -p owlry-core --frozen --lib
}

package() {
    cd "owlry"
    install -Dm755 "target/release/owlryd" "$pkgdir/usr/bin/owlryd"
    install -Dm644 "systemd/owlryd.service" "$pkgdir/usr/lib/systemd/user/owlryd.service"
    install -Dm644 "systemd/owlryd.socket" "$pkgdir/usr/lib/systemd/user/owlryd.socket"
    install -dm755 "$pkgdir/usr/lib/owlry/plugins"
    install -dm755 "$pkgdir/usr/lib/owlry/runtimes"
}
