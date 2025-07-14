# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=konfigkoll
_pkgver=0.1.15
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Personal system configuration manager for Arch Linux"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/paketkoll"
license=('MPL-2.0')
makedepends=('cargo' 'cmake' 'clang')
options=('!lto') # LTO breaks with ring
source=("$pkgname-$_pkgver.tar.gz::https://github.com/VorpalBlade/paketkoll/archive/refs/tags/$pkgname-v${_pkgver}.tar.gz")
sha256sums=('e89bda3d9e28307fd638f31ca3410e7e0941abc6a497841255ebc6a147637a6c')
_unpacked_dir="paketkoll-$pkgname-v$_pkgver"

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
    make CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}

check() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make test CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}

package() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make install-konfigkoll CC=clang CXX=clang++ DESTDIR="$pkgdir" PREFIX=/usr CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}
