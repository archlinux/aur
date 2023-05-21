pkgname=aur-check-updates
pkgver=1.0.3
pkgrel=1
pkgdesc="A very basic CLI app for checking updates from AUR"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/HanabishiRecca/${pkgname}"
license=('MIT')
depends=('libalpm.so' 'libcurl.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${_snapshot}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('23b6eaa7839f9bcee7fea576a2e19a17566bbf739254960214f66d7d17c64b90')

prepare() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR="${srcdir}/target"
    cargo build --frozen --release
}

check() {
    cd "${_snapshot}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
