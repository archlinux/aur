# Maintainer: Partha Pratim Gogoi 160270614+rugbedbugg@users.noreply.github.com
pkgname=resonanceid-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Shazam-style audio fingerprinting CLI that identifies songs from song clips"
arch=('x86_64')
url="https://github.com/rugbedbugg/ResonanceID-cli"
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib')
makedepends=('rust' 'cargo')
optdepends=('ffmpeg: audio conversion for the import command')
# !lto: libsqlite3-sys compiles the bundled SQLite amalgamation via the cc
#   crate; makepkg's GCC LTO objects can't be consumed by rust-lld, which
#   leaves the sqlite3_* symbols undefined at link time.
# !debug: the release profile sets strip = true upstream, so there are no
#   debug symbols to split into a -debug package.
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8a1ed67e93ec3e2453c24db2e8739c4084d306d39f60a1f907cea0a7cf03ec17')

_srcdir="ResonanceID-cli-$pkgver"

prepare() {
    cd "$_srcdir"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --bin resonanceid-cli
}

check() {
    cd "$_srcdir"
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/resonanceid-cli" "$pkgdir/usr/bin/resonanceid-cli"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
