# Maintainer: DeepChirp <DeepChirp@outlook.com>

pkgname=rustnet-git
_pkgname=${pkgname%-git}
_reponame=${pkgname%-git}
pkgver=r203.6d451c3
pkgrel=3
pkgdesc="A cross-platform network monitoring terminal UI tool built with Rust."
arch=('x86_64')
url="https://github.com/domcyrus/rustnet"
license=('Apache-2.0')
depends=('libpcap' 'libelf' 'zlib')
makedepends=('git' 'cargo' 'pkgconf' 'clang' 'llvm' 'lld' 'libbpf')
source=("git+https://github.com/domcyrus/rustnet.git")
md5sums=('SKIP')
options=(!debug strip)
install=$_pkgname.install

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable

    export CC="$(command -v clang)"
    export AR="$(command -v llvm-ar)"
    export NM="$(command -v llvm-nm)"
    export RANLIB="$(command -v llvm-ranlib)"
    _LD_LLD="$(command -v ld.lld)"

    export RUSTFLAGS="-Clinker=$CC -Clink-arg=-fuse-ld=${_LD_LLD}"
    export RUSTDOCFLAGS="$RUSTFLAGS"

    export CARGO_PROFILE_RELEASE_LTO=thin
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    CFLAGS='-flto=auto' cargo build --frozen --release --features ebpf
}

check() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable
    export CC="$(command -v clang)"
    export AR="$(command -v llvm-ar)"
    export NM="$(command -v llvm-nm)"
    export RANLIB="$(command -v llvm-ranlib)"
    _LD_LLD="$(command -v ld.lld)"

    export RUSTFLAGS="-Clinker=$CC -Clink-arg=-fuse-ld=${_LD_LLD}"
    export RUSTDOCFLAGS="$RUSTFLAGS"

    export CARGO_PROFILE_RELEASE_LTO=thin
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    CFLAGS='-flto=auto' cargo test --frozen --release --features ebpf
}

package() {
    cd "$srcdir/$_reponame"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
