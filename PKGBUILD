# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.1.1
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('0048c0d9f1869165797743c2bac4625e65bc9ec121aad7c731e388ecd45d543fe0ae497cee821b54526008d135bd65c92a986dcdde2620c112cdbc1233ca064d')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -vDm755 -t "${pkgdir}/usr/bin" target/release/pacman-mirrorup
    install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" pacman-mirrorup.service
    install -vDm644 -t "${pkgdir}/usr/lib/systemd/system" pacman-mirrorup.timer
    install -vDm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.adoc
}
