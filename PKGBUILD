# Maintainer:
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: qubidt <qubidt at gmail dot com>

pkgname=riffdiff
_pkgname=riff
pkgver=3.6.1
pkgrel=1
pkgdesc="A diff filter highlighting which line parts have changed"
arch=('x86_64')
url='https://github.com/walles/riff'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}") # binary name conflicts with riff dependency manager
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d360058f0e51d162235307498485f92dc57518877f5646f00521b97e92957bbe')

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
