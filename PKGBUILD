# Maintainer: Paul Wilde<paul@paulwilde.uk>
_pkgname=nemini
pkgname=${_pkgname}-git
pkgver=.r0.gb70c620
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
source=("${_pkgname%}::git+${url}")
conflicts=("${_pkgname}")
provides=(nemini)
pkgver() {
    cd "${srcdir}/${_pkgname}"
    _version=$(
      grep -E "^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$" meson.build \
        | sed -E "s@^\s+version:\s+'([0-9]+\.[0-9]+\.[0-9]+)',\$@\1@"
      )
    _commit=$(
      git log -S "${_version}" -1 --pretty=oneline | sed 's@\ .*$@@'
    )
    _revision=$(
      git rev-list --count "${_commit}..HEAD"
    )
    _hash=$(
      git rev-parse --short HEAD
    )
    echo "${_version}.r${_revision}.g${_hash}"
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
    install -Dm755 config/nemini.default.toml -T "${pkgdir}/etc/default/nemini.toml"
    install -Dm644 nemini.service -t "${pkgdir}/usr/lib/systemd/system"
}
install=install.sh
