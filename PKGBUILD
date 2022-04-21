# Maintainer: Carson McManus <carson.mcmanus1@gmail.com>
# Contributor: Mads Mogensen <mads256h at gmail dot com>

_pkgname=steamguard-cli
pkgname=${_pkgname}-git
pkgver=0.4.3.r18.g2da17c9
pkgrel=1
pkgdesc="A command line utility to generate Steam 2FA codes and respond to confirmations."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/dyc3/steamguard-cli"
license=('GPL3')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/dyc3/steamguard-cli.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags --match 'v*' | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    cargo build --release

    # completion
    "target/release/${_pkgname}" completion --shell bash > "$srcdir/${_pkgname}/${_pkgname}"
    "target/release/${_pkgname}" completion --shell zsh > "$srcdir/${_pkgname}/_${_pkgname}"
}

package() {
    cd "${srcdir}/${_pkgname}"
    # NOTE: Install as steamguard, otherwise completions won't work
    install -Dm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/steamguard"
    install -Dm0644 "${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/steamguard"
    install -Dm0644 "_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_steamguard"
}
