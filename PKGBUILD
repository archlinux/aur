# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.1.1
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('e4ee9b099610b88ccec53a0a17765a12383f22c6cd4a49762369088e7c659db93eabb030a48fe72368cc66661db1872e2c14bf9d1bc1a242efa229ce9ad473ab')

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
    cargo test -p owlry-core --frozen
}

package() {
    cd "owlry"
    install -Dm755 "target/release/owlry-core" "$pkgdir/usr/bin/owlry-core"
    install -Dm644 "systemd/owlry-core.service" "$pkgdir/usr/lib/systemd/user/owlry-core.service"
    install -Dm644 "systemd/owlry-core.socket" "$pkgdir/usr/lib/systemd/user/owlry-core.socket"
    install -dm755 "$pkgdir/usr/lib/owlry/plugins"
    install -dm755 "$pkgdir/usr/lib/owlry/runtimes"
}
