# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie
pkgver=0.2.1
pkgrel=1
epoch=
pkgdesc="Blazingly fast AI coding TUI for chivalrous people"
arch=("x86_64" "aarch64")
url="https://shuvarie.org/"
license=('MIT')
groups=()
depends=(glibc)
makedepends=(rust cargo clang lld)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
options=(lto strip)
install=
changelog=
_repourl='https://github.com/shuvarie/shuvarie'
source=(
    "shuvarie-v${pkgver}.tar.gz::${_repourl}/archive/refs/tags/v${pkgver}.tar.gz"
)
noextract=()
sha256sums=(
    "a450b1395debecc07fa719c6c2bb520698bd6c8cf992530da1c01eb5b105a806"
)
validpgpkeys=()

_dirname="shuvarie-$pkgver"

build() {
    cd $_dirname

    # The "lto" makepkg option adds -flto to CFLAGS, so cc-built C deps
    # (simsimd, zstd-sys, aws-lc-sys, ...) emit LLVM bitcode objects. GNU ld
    # (BFD) cannot parse bitcode ("file format not recognized"), so link with
    # lld, which handles LTO bitcode natively. Pin the C compiler and the
    # rustc linker to clang so the bitcode always matches the linking LLVM.
    export CC=clang CXX=clang++
    export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=clang
    export CARGO_TARGET_AARCH64_UNKNOWN_LINUX_GNU_LINKER=clang
    export RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=lld"

    cargo build --release --locked
}

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./target/release/shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
