# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=filkoll-git
_pkgname=${pkgname%-git}
pkgver=0.1.0.r4.67221b4
pkgrel=1
pkgdesc="Fast command-not-found handler for Arch Linux"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/filkoll"
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('filkoll::git+https://github.com/VorpalBlade/filkoll')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags --match "v*" | sed "s/v//;"'s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make CARGO_FLAGS='--frozen'
}

check() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make test CARGO_FLAGS='--frozen'
}

package() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make install DESTDIR="$pkgdir" PREFIX=/usr CARGO_FLAGS='--frozen'
}
