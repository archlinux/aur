# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=limbo
pkgver=0.0.18
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
makedepends=(cargo libgit2 mimalloc oniguruma)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz"
        'prune-deps.patch')
sha256sums=('8b9150db603bf4a77a7767937f72492395c55b16df769dbceccd97fbb3cdca6b'
            'd3518ed68d3866b3cbb9bace3374b652ef06daaf1035985c64266a5c981c390c')

prepare() {
    cd "${pkgname}_cli-$pkgver"
    patch -p1 -i ../prune-deps.patch
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p limbo_cli
}

package() {
    cd "${pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
