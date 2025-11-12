# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
pkgver=0.3.2
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
makedepends=(cargo libaegis libgit2 mimalloc oniguruma simsimd)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('c9003cea814641bd2d58a9343e336a9e609ba455234f28f0a9ef6556e57d582e')

prepare() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l aegis -l git2 -l mimalloc -l onig -l simsimd"
    cargo build --frozen --release -p turso_cli
}

package() {
    cd "${pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}db"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
