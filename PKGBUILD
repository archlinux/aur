# Maintainer: devome <evinedeng@hotmail.com>

pkgname=ptd-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line interface for the PT-Depiler browser extension"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/pt-plugins/${pkgname}"
license=('Unknown')
depends=("glibc" "libgcc")
makedepends=("cargo")
optdepends=("pt-depiler: A browser extension for managing PT sites")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8dbf588e0fe3b59c528f6ecfbd28e69abce61cd9ab47143d369112406bb708f4')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo update
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --frozen --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features --workspace
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/ptd{,-host} -t "${pkgdir}/usr/bin"
    install -Dm644 README*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
