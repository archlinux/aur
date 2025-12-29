# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.1.0
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('23ad5570e3d08bd02238c618228fb1f896152090baa95c5de7cd2fd0a934d8aafddee3ff570af7f1214f953edbc6c6fd5ab7abda29ce78734cfc2d0006a0bb77')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/pacman-mirrorup" "${pkgdir}/usr/bin/pacman-mirrorup"

    install -Dm644 "pacman-mirrorup.service" "${pkgdir}/usr/lib/systemd/system/pacman-mirrorup.service"
    install -Dm644 "pacman-mirrorup.timer" "${pkgdir}/usr/lib/systemd/system/pacman-mirrorup.timer"

    install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
}
