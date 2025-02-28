# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=filkoll
_pkgver=0.2.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Fast command-not-found handler for Arch Linux"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/filkoll"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/VorpalBlade/$pkgname/archive/refs/tags/v${_pkgver}.tar.gz")
sha256sums=('5b62c2cadad0dc9f9b800ba4fd3c332c57edc0313c335fe02b641b58777d081e')
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
