# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=certora-tac-optimizer
_repo=CertoraProver
_bin=tac_optimizer
pkgver=8.18.0
pkgrel=1
pkgdesc="Term-rewriting optimizer the Certora Prover shells out to while verifying rules"
arch=('x86_64')
url="https://www.certora.com"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
source=("${_repo}-${pkgver}.tar.gz::https://github.com/Certora/${_repo}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f81ca010bd193da5225c94dea406630122735420c2fcb03272eed6d460d58320')

latestver() {
    gh api --paginate "repos/Certora/${_repo}/releases" --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
    cd "${_repo}-${pkgver}/fried-egg"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "${_repo}-${pkgver}/fried-egg"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

package() {
    cd "${_repo}-${pkgver}/fried-egg"
    # The prover spawns this by bare name (ProcessBuilder in
    # analysis/rustblaster/RustBlasterPool), so it has to land on PATH.
    install -Dm755 "target/release/${_bin}" "${pkgdir}/usr/bin/${_bin}"
}
