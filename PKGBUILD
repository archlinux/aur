# Maintainer: Maximilian Luz <m@mxnluz.io>

_pkgname='pbpctrl'
pkgname="${_pkgname}-git"
pkgver=0.1.3.r0.gca33556
pkgrel=1
pkgdesc='Control Google Pixel Buds Pro from the Linux command line.'
url='https://github.com/qzed/pbpctrl'
license=('MIT' 'Apache')
arch=('x86_64')
depends=('gcc-libs' 'dbus' 'bluez')
makedepends=('git' 'rust' 'cargo' 'dbus' 'protobuf')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
    "${_pkgname}::git+https://github.com/qzed/pbpctrl.git"
)

sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
    cd "${srcdir}/${_pkgname}"
    env CARGO_TARGET_DIR="${PWD}/target" CARGO_INCREMENTAL=0 cargo build --release
    strip --strip-all "target/release/pbpctrl"
}

package() {
    install -D -m755 "${srcdir}/${_pkgname}/target/release/pbpctrl" "${pkgdir}/usr/bin/pbpctrl"

    # completion files
    install -D -m644 "${srcdir}/${_pkgname}/target/pbpctrl.bash" "${pkgdir}/usr/share/bash-completion/completions/pbpctrl"
    install -D -m644 "${srcdir}/${_pkgname}/target/_pbpctrl" "${pkgdir}/usr/share/zsh/site-functions/_pbpctrl"
    install -D -m644 "${srcdir}/${_pkgname}/target/pbpctrl.fish" "${pkgdir}/usr/share/fish/completions/pbpctrl.fish"

    # license
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/pbpctrl/LICENSE-MIT"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/pbpctrl/LICENSE-APACHE"
}
