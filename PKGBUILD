# Maintainer: devome <evinedeng@hotmail.com>

_cmdname=bradar
pkgname=bytes-radar
pkgver=0.6.0
pkgrel=1
pkgdesc="A fast code analysis tool for remote repositories with multi-platform support. Serverless optimized."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/zmh-program/${pkgname}"
license=('Apache-2.0')
provides=("${_cmdname}")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('83abaf9ceea378070549d59f1d7f6ea74cdb5a1823c9891558eed5d80ac4a41b')

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
    local _tgtbin="target/release/${_cmdname}"

    cd "${pkgname}-${pkgver}"
    install -Dm755 "${_tgtbin}" "${pkgdir}/usr/bin/${_cmdname}"
    install -Dm644 "README.md"  "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
