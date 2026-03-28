# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.1.3
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('3f7b9cde30a06d96f8c1fda1be72514ac5b0e835402c1a287bfd2d8ea92284874b5fcccfcd08d249eb7f28a3b5be6a3b77c495e610fe9742a6c7b3d5084c9894')

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
