# Maintainer: Maximilian Luz <m@mxnluz.io>

pkgname='pbpctrl'
pkgver=0.1.3
pkgrel=1
pkgdesc='Control Google Pixel Buds Pro from the Linux command line.'
url='https://github.com/qzed/pbpctrl'
license=('MIT' 'Apache')
arch=('x86_64')
depends=('gcc-libs' 'dbus' 'bluez')
makedepends=('git' 'rust' 'cargo' 'dbus' 'protobuf')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/qzed/pbpctrl/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=('bed31d7e118e827e5c62a509dece19dc5f2c440c6e30c0e87eba67cfd2c61666')

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    env CARGO_TARGET_DIR="${PWD}/target" CARGO_INCREMENTAL=0 cargo build --release
    strip --strip-all "target/release/pbpctrl"
}

package() {
    install -D -m755 "${srcdir}/${pkgname}-${pkgver}/target/release/pbpctrl" "${pkgdir}/usr/bin/pbpctrl"

    # completion files
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/target/pbpctrl.bash" "${pkgdir}/usr/share/bash-completion/completions/pbpctrl"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/target/_pbpctrl" "${pkgdir}/usr/share/zsh/site-functions/_pbpctrl"
    install -D -m644 "${srcdir}/${pkgname}-${pkgver}/target/pbpctrl.fish" "${pkgdir}/usr/share/fish/completions/pbpctrl.fish"

    # license
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/pbpctrl/LICENSE-MIT"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/pbpctrl/LICENSE-APACHE"
}
