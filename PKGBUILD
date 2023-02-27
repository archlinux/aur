# Maintainer: Sven Friedrich (sven At autumnal Dot de) 
pkgname=rosenpass-git
_pkgname=rosenpass
pkgver=0.1.1
pkgrel=2
pkgdesc="formally verified and post-quantum secure VPN over WireGuard"
url="https://rosenpass.eu"
_git="https://github.com/rosenpass/${_pkgname}.git"
arch=(any)
license=(MIT APACHE)
makedepends=('cargo' 'git' 'cmake' 'pkg-config' 'rust-bindgen')
depends=('libsodium' 'gawk' 'wireguard-tools' 'findutils')
provides=('rp' 'rosenpass')
conflicts=()
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

_bin=rosenpass
_script=rp

pkgver() {
    cd "${_pkgname}"
    cargo pkgid rosenpass | grep -oE "[^#]+$"
}

prepare() {
    cd "${_pkgname}"
    cargo fetch --locked --target $CARCH-unknown-linux-gnu
}

build() {
    cd "${_pkgname}"
    cargo build --release --frozen
}

check() {
    cd "${_pkgname}"
    cargo test --frozen
}

package() {
    cd "${_pkgname}"
    install -Dm 0755 "target/release/${_bin}" "${pkgdir}/usr/bin/${_bin}"
    install -Dm 0755 "${_script}" "${pkgdir}/usr/bin/${_script}"
    install -Dm 0644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm 0644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
}
