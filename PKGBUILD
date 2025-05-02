# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=limbo
pkgver=0.0.19
pkgrel=1
pkgdesc='Limbo is a work-in-progress, in-process OLTP database management system, compatible with SQLite.'
url='https://github.com/tursodatabase/limbo'
license=('MIT')
arch=('x86_64')
# LTO must be disabled until we find a way to build onig_sys with GCC 15
options=(!lto)
# GCC 14 required until we find a way to build onig_sys with GCC 15
makedepends=(gcc14 cargo libgit2 mimalloc oniguruma)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz"
        'prune-deps.patch')
sha256sums=('106ee2e5597253042e1f2fab089b22c25407557346850a46dc0c9ad69a19dbcb'
            '2b0794a2ac6f4df4c585c7508a6e887b5bc58c060b6d837342b74eed486d1b59')

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
    # GCC 14 required until we find a way to build onig_sys with GCC 15
    export CC=gcc-14
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p limbo_cli
}

package() {
    cd "${pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
