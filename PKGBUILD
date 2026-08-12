# Maintainer: AshLink <ashraf.zoubeh.123@gmail.com>

pkgname=fallegji-git
pkgver=2.0.0.r0.40b3df3 
pkgrel=1
pkgdesc='TUI P2P group chat app, written in Rust, bound to LAN, VPN or onion network'
arch=('x86_64')
url='https://github.com/AshLink95/Fallegji'
license=('MIT')

depends=('glibc')
makedepends=('rust' 'git')
options=(!lto)

source=("${pkgname}::git+https://github.com/AshLink95/Fallegji.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    if git describe --tags --long &>/dev/null; then
        git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
    else
        echo "0.r0.g$(git rev-parse --short HEAD)"
    fi
}

build() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 target/release/fallegji "$pkgdir/usr/bin/fallegji"
}
