# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
# This can be changed back to 'turso' after the next release
_old_pkgname=limbo
pkgver=0.0.22
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
# LTO must be disabled until we find a way to build onig_sys with GCC 15
options=(!lto)
# GCC 14 required until we find a way to build onig_sys with GCC 15
makedepends=(gcc14 cargo libgit2 mimalloc oniguruma)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('e94bd5849eb82f55db606ab8c9d3bb5928050166698807689b654657370530ad')

prepare() {
    cd "${_old_pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_old_pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # GCC 14 required until we find a way to build onig_sys with GCC 15
    export CC=gcc-14
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p limbo_cli
}

package() {
    cd "${_old_pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_old_pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
