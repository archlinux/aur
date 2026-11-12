# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
pkgver=0.8.3
pkgrel=1
pkgdesc='An in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64' 'aarch64')
options=(!lto)
depends=(glibc libgcc)
makedepends=(cargo libaegis libgit2 mimalloc simsimd)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('5a47bee73c66be9abccc92ae03d1ca519e5d706b48a2bad8945147bb388ef84c')

prepare() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTONIG_SYSTEM_LIBONIG=1
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l aegis -l git2 -l mimalloc -l simsimd"
    cargo build --frozen --release -p turso_cli
}

package() {
    cd "${pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}db"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
