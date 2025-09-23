# Maintainer: Tomasz Cebula <tomasz.cebula@gmail.com>

pkgname=reaction
pkgver=2.2.1
_pkgver="v${pkgver/rc/-rc}"
pkgrel=1
pkgdesc="A daemon that scans program outputs for repeated patterns, and takes action. A lightweight alternative to fail2ban."
arch=('x86_64' 'aarch64')
url="https://framagit.org/ppom/reaction"
license=('AGPL')
optdepends=('nftables' 'firewalld')
makedepends=('cargo')
provides=('reaction' 'ip46tables' 'nft46')
conflicts=('reaction-git')
backup=('etc/reaction.jsonnet')
source=("https://framagit.org/ppom/reaction/-/archive/${_pkgver}/reaction-${_pkgver}.tar.gz")
sha256sums=('e2b1c6927a1fa4da10e2e356aeafa00bbcbf7a4228355f944bb96d79532d3bf0')

prepare() {
    cd "${pkgname}-${_pkgver}"
    sed -i "s|/usr/local/bin/reaction|/usr/bin/reaction|g" config/reaction.service
}

build() {
    cd "${pkgname}-${_pkgver}"
    make
}

package() {
    install -Dm755 "${pkgname}-${_pkgver}/target/release/reaction" "${pkgdir}/usr/bin/reaction"
    install -Dm755 "${pkgname}-${_pkgver}/target/release/ip46tables" "${pkgdir}/usr/bin/ip46tables"
    install -Dm755 "${pkgname}-${_pkgver}/target/release/nft46" "${pkgdir}/usr/bin/nft46"
    install -Dm644 "${pkgname}-${_pkgver}/config/reaction.service" "${pkgdir}/usr/lib/systemd/system/reaction.service"
    install -Dm644 "${pkgname}-${_pkgver}/config/example.jsonnet" "${pkgdir}/etc/reaction.jsonnet"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/reaction.bash" "${pkgdir}/usr/share/bash-completion/completions/reaction"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/reaction.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/reaction.fish"
    install -Dm644 "${pkgname}-${_pkgver}/target/release/_reaction" "${pkgdir}/usr/share/zsh/site-functions/_reaction"
}
