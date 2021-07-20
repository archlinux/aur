# Maintainer: Grzegorz Baranski <root@gbaranski.com>

_pkgname=houseflow
pkgname="${_pkgname}-git"
pkgver=0.5.0.r245.g3ea8c393
pkgrel=4
pkgdesc="Home automation platform, written in Rust"
arch=(
    'x86_64'
    'arm'
    'armv6h'
    'armv7h'
    'aarch64'
    'i686'
)
url="https://github.com/gbaranski/houseflow"
license=('GPL-3.0')
makedepends=(
    'git'
    'rust'
    'cargo'
)
source=("${_pkgname}::git+https://github.com/gbaranski/houseflow")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

check() {
    cd "${_pkgname}"
    cargo test --release --locked
}

prepare() {
    cd "${_pkgname}"
    cargo fetch --locked
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    "./target/release/${_pkgname}" completions fish >> completions.fish
    "./target/release/${_pkgname}" completions bash >> completions.bash
    install -Dm 644 completions.fish "${pkgdir}/usr/share/fish/vendor_completions.d/houseflow.fish"
    install -Dm 644 completions.bash "${pkgdir}/usr/share/bash-completion/completions/houseflow"
}
