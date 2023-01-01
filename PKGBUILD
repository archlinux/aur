# Maintainer: Maximilian Luz <m@mxnluz.io>

pkgname='pbpctrl'
pkgver=0.1.0
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

md5sums=('3ed8ef522fd213288698334e1f8037d9')

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
