# Maintainer: Frikilinux <frikilinux@gmail.com>
pkgname=aries-connect
pkgver=0.2.0
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
url="https://github.com/Frikilinux/aries-connect"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=(cargo)
options=(!lto)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('d07086c3cba7c42620c32ac4e1e8b834fc66a0a74ff418e2b2037db0c760ff6d')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/aries-connect "${pkgdir}/usr/bin/aries-connect"
    install -Dm644 contrib/aries-connect.service \
        "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
