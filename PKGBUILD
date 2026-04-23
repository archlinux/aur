# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=smolvm-git
_pkgname=smolvm
pkgver=0.5.20.r0.g27e4604
pkgrel=1
pkgdesc='Tool to build & run portable, lightweight, self-contained virtual machines.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/smol-machines/smolvm'
license=('Apache-2.0')
depends=('libkrun' 'libkrunfw')
makedepends=('cargo' 'libkrun' 'libkrunfw' 'git')
options=(!lto)
provides=('smolvm')
conflicts=('smolvm' 'smolvm-bin')
source=("$_pkgname-main::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/smolvm "$pkgdir/usr/bin/smolvm"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
