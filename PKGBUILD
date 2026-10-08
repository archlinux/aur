# Maintainer: Charles Dong <chardon_cs@proton.me>

pkgname=shuvarie
pkgver=0.3.2
pkgrel=1
epoch=
pkgdesc="Blazingly fast AI coding TUI for chivalrous people"
arch=("x86_64" "aarch64")
url="https://github.com/shuvarie/shuvarie"
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
    "cb03e791154130da5f7e6ec923e368f4e85eab63b554b7ea1e9271f34775f3a5"
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

    # cc-rs appends the environment CFLAGS *after* the flags a build script
    # asks for, so makepkg's -O2 overrides them. aws-lc-sys depends on that
    # ordering for its jitterentropy sources: jitterentropy-base.c aborts with
    # #error unless it is compiled with -O0, and the crate's own CFLAGS fix-up
    # no longer applies because cc-rs >= 1.6 snapshots the environment once per
    # build script. Drop the optimization flags and let cc-rs use cargo's
    # opt-level (profile.release = "s" in Cargo.toml) for the other C sources.
    _strip_opt_flags() {
        local flag out=()
        for flag in $1; do
            [[ $flag == -O* ]] || out+=("$flag")
        done
        printf '%s' "${out[*]}"
    }
    export CFLAGS="$(_strip_opt_flags "$CFLAGS")"
    export CXXFLAGS="$(_strip_opt_flags "$CXXFLAGS")"

    cargo build --release --locked
}

package() {
    cd $_dirname

    mkdir -p "$pkgdir/usr/bin"
    install -m755 -t "$pkgdir/usr/bin" ./target/release/shuvarie

    mkdir -p "$pkgdir/usr/share/licenses/shuvarie"
    install -m644 -t "$pkgdir/usr/share/licenses/shuvarie" ./LICENSE
}
