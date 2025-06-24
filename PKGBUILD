# Maintainer: wackbyte <im@purring.fyi>

_pkgname=tarmac
pkgname=tarmac-git
pkgver=0.8.2.r0.g30292b7
pkgrel=1
pkgdesc='Command line tool to manage Roblox assets'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/Roblox/tarmac'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')
options=(!lto)

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd $_pkgname
    cargo test --frozen
}

package() {
    cd $_pkgname
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE.txt
}
