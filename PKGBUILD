# Maintainer: blinry <mail@blinry.org>

pkgname=ethersync-git
pkgver=r1522.efba7b7
pkgrel=1
pkgdesc="Enables real-time co-editing of local text files."
arch=('i686' 'x86_64')
url="https://github.com/ethersync/ethersync"
license=('AGPL-3.0-or-later')
makedepends=(git cargo)
options=('!lto')
conflicts=('ethersync')
source=("$pkgname::git+https://github.com/ethersync/ethersync")
sha1sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname/daemon"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname/daemon"
    cargo build --frozen --release
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    cd "$pkgname/daemon"
    install -Dm755 "target/release/ethersync" "$pkgdir/usr/bin/ethersync"
}
