# Maintainer: devome <evinedeng@hotmail.com>

_cmdname="vika"
pkgname="${_cmdname}-cli"
pkgver=0.1.5
pkgrel=1
pkgdesc="CLI for the Vika (vikadata) API — designed for AI agents."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/vikadata/${pkgname}"
license=('Unknown')
provides=("${_cmdname}")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('13b451a0cda45ea4bf9a7055c08c90f1cdcc6776a165e15018756267bf087c36')

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
    local _tgtbin="target/release/${_cmdname}"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${_tgtbin}" "${pkgdir}/usr/bin/${_cmdname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
