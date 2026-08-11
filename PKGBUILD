# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=rtk
pkgver=0.45.0
pkgrel=1
pkgdesc='CLI proxy that reduces LLM token consumption by 60-90% on common dev commands'
arch=('x86_64' 'aarch64')
url='https://github.com/rtk-ai/rtk'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
provides=('rtk')
conflicts=('rtk-bin')
options=(!lto)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0459f63cb79f610751974ba20732e273d45ddbb4cd0c0795768b62b868891ad9')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/rtk -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
