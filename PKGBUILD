# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=filkoll
_pkgver=0.1.0
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Fast command-not-found handler for Arch Linux"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/filkoll"
license=('GPL-3.0-only')
makedepends=('cargo')
options=('!lto') # LTO breaks with zlib-ng
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/VorpalBlade/$pkgname/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('ed4e2d5eed2d8a44b062f886b94969984fcc5a52904404dc08a4c9d192ba1196')
_unpacked_dir="${pkgname}-${_pkgver}"

prepare() {
    cd "$srcdir/$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make CARGO_FLAGS='--frozen'
}

check() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make test CARGO_FLAGS='--frozen'
}

package() {
    cd "$_unpacked_dir"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make install DESTDIR="$pkgdir" PREFIX=/usr CARGO_FLAGS='--frozen'
}
