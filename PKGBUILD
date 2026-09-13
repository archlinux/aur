# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Edmund Lodewijks <echo "==gCt92YuwWah1WYlR3byBHQ4VnbpxGajJXY" | rev | base64 -d>

pkgname=oniux
pkgver=0.13.0
pkgrel=1
pkgdesc='Isolate applications over Tor using Linux namespaces'
arch=(x86_64)
url=https://gitlab.torproject.org/tpo/core/oniux
license=('MIT OR Apache-2.0')
depends=(glibc libgcc sqlite zstd)
makedepends=(cargo git)
source=(git+$url.git#tag=v$pkgver?signed)
validpgpkeys=('772628464C6E8F56DBB5ACEC4CBE96203A1A78A7'  # Clara Engler <cve@cve.cx>
              '1C1BC007A9F607AA8152C040BEA7B180B1491921') # Alexander Færøy <ahf@0x90.dk>
b2sums=('99db41c4117ba1b98ced770ffc567e5357e60b11bce6bcbb2a0533abed5a35f51596dbc77aff6bd01b734515f073ebc3fd7dbe77847258a0d931bdcc06b6d7b8')

prepare() {
    cd oniux
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd oniux
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-objects"

    export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
    export ZSTD_SYS_USE_PKG_CONFIG=1

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_PROFILE_RELEASE_DEBUG=true
    cargo build --frozen --release --all-features
}

package() {
    cd oniux
    install -Dm755 target/release/oniux -t "$pkgdir/usr/bin/"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 examples/bridges/README.md "$pkgdir/usr/share/doc/$pkgname/bridges.md"
    install -Dm644 CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE-MIT -t "$pkgdir/usr/share/licenses/$pkgname"
}
