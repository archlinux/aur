# Maintainer: devome <evinedeng@hotmail.com>

pkgname=cmd-wrapped
pkgver=0.4.1
pkgrel=2
pkgdesc="A CLI to view your shell history stats, with support for zsh, bash, fish, and atuin."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/YiNNx/${pkgname}"
license=('MIT')
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f40fd675c5a3d962cdb5773f070e27c2886189076ce08779da93a5a39ce32566')

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE                     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 *.md                     -t "${pkgdir}/usr/share/doc/${pkgname}"
}
