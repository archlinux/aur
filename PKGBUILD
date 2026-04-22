# Maintainer: Mara <your-email@example.com>
pkgname=fnord
pkgver=0.1.1
pkgrel=1
pkgdesc="A Discordian calendar, lunar phase calculator, and chaos utility. Weighs exactly 5 tons of flax."
arch=('x86_64' 'aarch64')
url='https://github.com/maravexa/fnord'
license=('MIT')
makedepends=('cargo')
# Pure Rust with no system library dependencies beyond glibc
depends=('gcc-libs')
# Crate is "fn0rd" on crates.io (someone claimed "fnord"), binary/AUR/GitHub are all "fnord"
_cratename=fn0rd
source=("$_cratename-$pkgver.tar.gz::https://static.crates.io/crates/$_cratename/$_cratename-$pkgver.crate")
b2sums=('ceb24982da0cf8f580bfa3982f2ea43d40eb8911538ae2072271c165addaeeb901f8a6bb98f2439fe48ef8e04305690a2a19303af5408964de2933f181fb2f31')

# If you prefer to build from GitHub instead of crates.io (recommended —
# includes LICENSE, tests, and full repo contents):
#
# source=("$pkgname-$pkgver.tar.gz::https://github.com/maravexa/fnord/archive/refs/tags/v$pkgver.tar.gz")
#
# When using GitHub source, change all cd "$_cratename-$pkgver" to:
#   cd "$pkgname-$pkgver"  (GitHub extracts to fnord-0.1.1/)

prepare() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$_cratename-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --all-features
}

package() {
    cd "$_cratename-$pkgver"
    # Verify the binary name matches: ls target/release/
    # If the binary is "fn0rd" instead of "fnord", change $pkgname to $_cratename below
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
