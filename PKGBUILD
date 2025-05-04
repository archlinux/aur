# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=konfigkoll-git
_pkgname=${pkgname%-git}
pkgver=0.1.12.r4.fdbd856
pkgrel=1
pkgdesc="Personal system configuration manager for Arch Linux"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/paketkoll"
license=('MPL-2.0')
makedepends=('cargo' 'cmake' 'git' 'clang')
options=('!lto') # LTO breaks with ring
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('konfigkoll::git+https://github.com/VorpalBlade/paketkoll')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "%s" "$(git describe --long --tags --match "${_pkgname}-v*" | sed "s/${_pkgname}-v//;"'s/\([^-]*-\)g/r\1/;s/-/./g')"
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
    make CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}

check() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make test CC=clang CXX=clang++ CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}

package() {
    cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    make install-konfigkoll CC=clang CXX=clang++ DESTDIR="$pkgdir" PREFIX=/usr CARGO_FLAGS='--frozen --no-default-features --features=arch_linux -p konfigkoll -p xtask'
}
