# Maintainer: Josephine Pfeiffer <hi@josie.lol>
pkgname=nispor-git
pkgver=2.0.2.r10.g7c099ac
pkgrel=1
pkgdesc='Unified interface for Linux network state querying'
arch=('x86_64')
url='https://github.com/nispor/nispor'
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("nispor=${pkgver%%.r*}")
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
    cargo generate-lockfile
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --workspace
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo --config 'target.x86_64-unknown-linux-gnu.runner="env"' \
        test --frozen --package nispor --lib -- --skip integ_tests::
}

package() {
    cd "$pkgname"
    install -Dm755 target/release/npc "$pkgdir/usr/bin/npc"
}
