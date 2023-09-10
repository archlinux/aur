# Maintainer: Qther <dtaclanlegion@gmail.com>
_pkgname=parui
pkgname=${_pkgname}-git
pkgver=1.0.11.r0.63af503
pkgrel=2
pkgdesc="Simple TUI frontend for paru or yay."
arch=('x86_64')
url="https://github.com/Vonr/parui"
license=('MIT')
depends=('glibc' 'git' 'pacman' 'gcc-libs')
makedepends=('cargo')
optdepends=('paru: default AUR interface'
            'yay: alternative AUR interface')
source=('git+https://github.com/Vonr/parui')
md5sums=('SKIP')
options=('!lto')

prepare() {
    cd "$srcdir/${_pkgname}"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "${_pkgname}"
    printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="$CFLAGS -fno-lto"

    cargo build --release
}

package() {
	cd "$srcdir/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
