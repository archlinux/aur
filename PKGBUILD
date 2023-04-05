# Maintainer: Paul Wilde<paul@paulwilde.uk>
_pkgname=nemini
pkgname=${_pkgname}-git
pkgver=dadf45a
pkgrel=1
pkgdesc="Nemini is a simple to configure Gemini server with virtual host, alias, headers/footers and redirect support"
url="https://codeberg.org/pswilde/nemini.git"
arch=(any)
license=("AGPLv3")
depends=(
    openssl
)
sha256sums=('SKIP')
makedepends=(
    git
    make
    nim
    nimble
)
source=("${_pkgname%}::git+https://codeberg.org/pswilde/nemini")
conflicts=("${_pkgname}")
provides=(nemini)
pkgver() {
    cd "${_pkgname%-git}"
    printf "$(git rev-parse --short HEAD)"
}
build() {
    cd "${_pkgname%-git}"
    nimble build
}
package() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p "${pkgdir}/usr/local/bin"
    mkdir -p "${pkgdir}/srv/gemini/demo_site"
    mkdir -p "${pkgdir}/etc/nemini/certs"
    mkdir -p "${pkgdir}/etc/systemd/system"
    install -Dm755 nemini -t "${pkgdir}/usr/local/bin"
    cp -r demo_site/* "${pkgdir}/srv/gemini/demo_site/"
    install -Dm755 config/nemini.default.toml -T "${pkgdir}/etc/nemini/nemini.default.toml"
    install -Dm644 nemini.service -t "${pkgdir}/usr/lib/systemd/system"
}
install=install.sh
