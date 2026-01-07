# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=turso
pkgver=0.4.2
pkgrel=1
pkgdesc='Turso Database is an in-process SQL database, compatible with SQLite.'
url='https://github.com/tursodatabase/turso'
license=('MIT')
arch=('x86_64')
makedepends=(cargo libaegis libgit2 mimalloc oniguruma simsimd)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/source.tar.gz")
sha256sums=('05748c7bd370622455797aa4f70b2b63da76261a2e7ecd4081d859e755e80758')

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
