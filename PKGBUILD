# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=reaction
pkgver=2.3.0
_pkgver="v${pkgver/rc/-rc}"
pkgrel=1
pkgdesc="A daemon that scans program outputs for repeated patterns, and takes action. A lightweight alternative to fail2ban."
arch=('x86_64' 'aarch64')
url="https://framagit.org/ppom/reaction"
license=('AGPL')
optdepends=('nftables' 'firewalld')
makedepends=('cargo')
provides=('reaction')
conflicts=('reaction-git')
backup=('etc/reaction/reaction.jsonnet')
source=("https://framagit.org/ppom/reaction/-/archive/${_pkgver}/reaction-${_pkgver}.tar.gz")
sha256sums=('8068d9124e5b77d26573e106c1d3c092f02314e1bb44b72f1a73310c3c3bfa05')

prepare() {
    cd "${pkgname}-${_pkgver}"
    sed -i "s|/usr/local/bin/reaction|/usr/bin/reaction|g" config/reaction.service
}

build() {
    cd "${pkgname}-${_pkgver}"
    export RUSTFLAGS="--remap-path-prefix=${srcdir}=/build"
    make
}

package() {
    install -Dm755 "${pkgname}-${_pkgver}/target/release/reaction" "${pkgdir}/usr/bin/reaction"
    install -Dm644 "${pkgname}-${_pkgver}/config/reaction.service" "${pkgdir}/usr/lib/systemd/system/reaction.service"
    install -Dm644 "${pkgname}-${_pkgver}/config/example.jsonnet" "${pkgdir}/etc/reaction/reaction.jsonnet"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/reaction.bash" "${pkgdir}/usr/share/bash-completion/completions/reaction"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/reaction.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/reaction.fish"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/_reaction" "${pkgdir}/usr/share/zsh/site-functions/_reaction"
}
