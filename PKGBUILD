# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=paketkoll
_pkgver=0.3.16
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Fast integrity check for files installed by pacman"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/paketkoll"
license=('MPL-2.0')
makedepends=('cargo' 'cmake' 'clang')
options=('!lto') # LTO breaks with ring
source=("$pkgname-$_pkgver.tar.gz::https://github.com/VorpalBlade/$pkgname/archive/refs/tags/$pkgname-v${_pkgver}.tar.gz")
sha256sums=('82d984b1691f046d69ede2f0582fc67e41666d12295518037a8fa4512b9897c7')
_unpacked_dir="$pkgname-$pkgname-v$_pkgver"

prepare() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux,json -p paketkoll -p xtask'
}

check() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make test CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux,json -p paketkoll -p xtask'
}

package() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make install-paketkoll CC=clang CXX=clang++ DESTDIR="$pkgdir" PREFIX=/usr CARGO_FLAGS='--frozen --no-default-features --features=arch_linux,json -p paketkoll -p xtask'
}
