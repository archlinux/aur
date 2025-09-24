# Maintainer: wackbyte <im@purring.fyi>

_pkgname=uiua
pkgname=uiua-git
pkgver=0.17.0.r5.g7f55d31c
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}::git+https://github.com/uiua-lang/uiua")
md5sums=('SKIP')
options=(!lto)

pkgver() {
    cd $_pkgname
    git describe --long --tags --exclude latest | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd $_pkgname
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    cargo build --frozen --release --features 'full no_self_update system'
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    cargo test --frozen --features 'full no_self_update system'
}

package() {
    cd $_pkgname
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" license
}
