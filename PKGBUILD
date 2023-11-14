pkgname=aur-check-updates
pkgver=1.0.9
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c60cb3b000f7574d34119245841f4430bdd1afd653cca81dabc336890def50c5')

export RUSTUP_TOOLCHAIN=stable
export CARGO_BUILD_TARGET="${CARCH}-unknown-linux-gnu"

prepare() {
    cd "${_snapshot}"
    cargo fetch --locked
}

build() {
    cd "${_snapshot}"
    export CARGO_TARGET_DIR="${srcdir}"
    cargo build --frozen --release
}

check() {
    cd "${_snapshot}"
    cargo test --frozen
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "${CARGO_BUILD_TARGET}/release/${pkgname}"
}
