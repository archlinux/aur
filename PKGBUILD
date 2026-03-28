# Maintainer: vikingowl <christian@nachtigall.dev>
pkgname=owlry-core
pkgver=1.2.1
pkgrel=1
pkgdesc='Core daemon for the Owlry application launcher — manages plugins, providers, and search'
arch=('x86_64')
url='https://somegit.dev/Owlibou/owlry'
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://somegit.dev/Owlibou/owlry/archive/owlry-core-v$pkgver.tar.gz")
b2sums=('8967562bda33820b282350eaad17e8194699926b721eabe978fb0b70af2a75e399866c6bfa7abb449141701bad618df56079c7e81358708b1852b1070b0b7c05')

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
