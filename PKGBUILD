# Maintainer: Michael Behrens <mfbehrens@t-online.de>
# Contributor: Luca Bauer <git@lucabauer.de>

_pkgname=kosmonaut
pkgname=${_pkgname}-git
pkgver=0.0.1.r96.g85522ef
pkgrel=1
pkgdesc="A modern NetworkManager TUI written in Rust"
arch=('x86_64')
url="https://codeberg.org/kosmonaut/kosmonaut"
license=('GPL-3.0-only')
depends=('networkmanager')
makedepends=('git' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local base
    base="$(sed -n 's/^version *= *"\([^"]*\)".*/\1/p' Cargo.toml | head -n1)"
    printf '%s.r%s.g%s' "${base:-0.0.1}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --frozen --release
}

# check() {
#     cd "${srcdir}/${_pkgname}"
#     cargo test --frozen
# }

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
