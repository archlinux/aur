# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.1.2
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('2445d097fd6472fd2b6db063ed3f68dc4c5707dfb3fab23b3b9b6b5231732a4df9502112337a513ec7c34a2e613ea895af3bddd54dcfd58b104c0265c1c78034')

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
    install -Dm755 "target/release/owlry-core" "$pkgdir/usr/bin/owlry-core"
    install -Dm644 "systemd/owlry-core.service" "$pkgdir/usr/lib/systemd/user/owlry-core.service"
    install -Dm644 "systemd/owlry-core.socket" "$pkgdir/usr/lib/systemd/user/owlry-core.socket"
    install -dm755 "$pkgdir/usr/lib/owlry/plugins"
    install -dm755 "$pkgdir/usr/lib/owlry/runtimes"
}
