# Maintainer: Hannaeko <tech+aur@hannaeko.eu>

pkgname=reaction-bin
pkgver=2.3.0
_pkgver="v${pkgver/rc/-rc}"
pkgrel=1
pkgdesc="A daemon that scans program outputs for repeated patterns, and takes action. A lightweight alternative to fail2ban."
arch=('x86_64')
url="https://framagit.org/ppom/reaction"
license=('AGPL')
optdepends=('nftables' 'firewalld')
provides=('reaction')
conflicts=('reaction')
backup=('etc/reaction/reaction.jsonnet')
source=(
    "https://static.ppom.me/reaction/releases/${_pkgver}/reaction-${_pkgver}-amd64.tar.gz"
    "https://framagit.org/ppom/reaction/-/raw/${_pkgver}/config/example.jsonnet"
)
sha256sums=('24d1e6ae5dfda90ef18c42e29a03ce29f07c6daf83c64173a7a2d08e98c03498'
            'e32fb135261493d960df8276acb5c466d4f8c15768042df790863680c17fc400')

prepare() {
    cd "reaction-${_pkgver}-amd64"
    sed -i "s|/usr/local/bin/reaction|/usr/bin/reaction|g" reaction.service
}

package() {
    install -Dm644 "example.jsonnet" "${pkgdir}/etc/reaction/reaction.jsonnet"

    cd "reaction-${_pkgver}-amd64"

    install -Dm755 reaction "${pkgdir}/usr/bin/reaction"
    install -Dm755 reaction-plugin-virtual "${pkgdir}/usr/bin/reaction-plugin-virtual"
    install -Dm755 reaction-plugin-ipset "${pkgdir}/usr/bin/reaction-plugin-ipset"

    install -Dm644 reaction.service "${pkgdir}/usr/lib/systemd/system/reaction.service"

    install -Dm644 reaction*.1 -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 reaction.bash "${pkgdir}/usr/share/bash-completion/completions/reaction"
    install -Dm644 reaction.fish "${pkgdir}/usr/share/fish/vendor_completions.d/reaction.fish"
    install -Dm644 _reaction "${pkgdir}/usr/share/zsh/site-functions/_reaction"
}
