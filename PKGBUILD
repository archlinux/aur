# Maintainer: KercyDing <dkx215417@gmail.com>
pkgname=only-git
pkgver=0.4.0
pkgrel=1
pkgdesc="A deterministic cross-platform task runner (git version)"
arch=('x86_64' 'aarch64')
url="https://github.com/KercyDing/only"
license=('MIT')
makedepends=('cargo' 'git')
provides=('only')
conflicts=('only-bin')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd only
    git describe --tags --long 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "$pkgver"
}

prepare() {
    cd only
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd only
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p only
}

package() {
    install -Dm755 "only/target/release/only" "${pkgdir}/usr/bin/only"
}
