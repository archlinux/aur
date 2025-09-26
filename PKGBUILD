# Maintainer: DeepChirp <DeepChirp@outlook.com>

pkgname=rustnet-git
_pkgname=${pkgname%-git}
_reponame=${pkgname%-git}
pkgver=r203.6d451c3
pkgrel=1
pkgdesc="A cross-platform network monitoring terminal UI tool built with Rust."
arch=('x86_64')
url="https://github.com/domcyrus/rustnet"
license=('Apache-2.0')
depends=('libpcap' 'libelf' 'zlib')
makedepends=('git' 'cargo' 'pkgconf' 'clang' 'llvm' 'libbpf')
source=("git+https://github.com/domcyrus/rustnet.git")
md5sums=('SKIP')
options=(!debug !lto) # https://github.com/Canop/broot/issues/852
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
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --features ebpf
}

check() {
    cd "$srcdir/$_reponame"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --features ebpf
}

package() {
    cd "$srcdir/$_reponame"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
