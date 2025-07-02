# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
pkgver=0.1.1
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
makedepends=(cargo libgit2 mimalloc oniguruma)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('b204e5947a19db976e775728f2197bbe30290728d6454b94505e9332357febee')

prepare() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}_cli-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -l git2 -l mimalloc -l onig"
    cargo build --frozen --release -p turso_cli
}

package() {
    cd "${pkgname}_cli-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}db"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
