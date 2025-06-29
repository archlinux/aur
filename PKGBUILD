# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
# This can be changed back to 'turso' after the next release
_old_pkgname=limbo
pkgver=0.1.0_pre.2
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
# LTO must be disabled until we find a way to build onig_sys with GCC 15
options=(!lto)
# GCC 14 required until we find a way to build onig_sys with GCC 15
makedepends=(gcc14 cargo libgit2 mimalloc oniguruma)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver/_/-}/source.tar.gz")
sha256sums=('c20bacc51d8ea633159924c3572069991393d23a342dd21599abda65f8ea7ce9')

prepare() {
    cd "${pkgname}_cli-${pkgver/_/-}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}_cli-${pkgver/_/-}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GCC 14 required until we find a way to build onig_sys with GCC 15
    export CC=gcc-14
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p turso_cli
}

package() {
    cd "${pkgname}_cli-${pkgver/_/-}"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}db"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
