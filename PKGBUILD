# Maintainer: Junxuan Liao <mikeljx at 126 dot com>
pkgname=probex-git
pkgver=0.1.17.r6.gab88e0b
pkgrel=1
pkgdesc="Low-friction Linux profiler with integrated web viewer"
arch=('x86_64')
url="https://github.com/XiangpengHao/probex"
license=('(MIT OR Apache-2.0) AND (GPL-2.0-only OR MIT)')
depends=('glibc')
makedepends=('git' 'rustup' 'clang' 'bpf-linker' 'dioxus-cli')
provides=('probex')
conflicts=('probex')
source=("probex::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/probex"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
    cd "$srcdir/probex"
    export RUSTUP_TOOLCHAIN=nightly
    export CC=clang
    rustup component add rust-src --toolchain nightly
    cargo fetch --locked
}

build() {
    cd "$srcdir/probex"
    export RUSTUP_TOOLCHAIN=nightly
    export CC=clang
    cargo build --release -p probex --locked
}

package() {
    cd "$srcdir/probex"
    install -Dm755 target/release/probex "$pkgdir/usr/bin/probex"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
