# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=nispor-git
pkgver=2.0.2.r7.g6836841
pkgrel=1
pkgdesc='Unified interface for Linux network state querying'
arch=('x86_64')
url='https://github.com/nispor/nispor'
license=('Apache-2.0')
depends=('glibc')
makedepends=('cargo' 'git')
provides=('nispor')
conflicts=('nispor')
options=(!debug)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --workspace
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/npc "$pkgdir/usr/bin/npc"
}
