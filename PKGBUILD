# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
pkgver=0.6.1
pkgrel=1
pkgdesc='An in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
options=(!lto)
depends=(glibc libgcc)
makedepends=(cargo libaegis libgit2 mimalloc simsimd)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('867c162284356bb2e524940155e5a62deb53b15e1e997bb0b150fed8cbda8c5d')

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
