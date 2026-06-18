# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Moshpit agent daemon — passphrase unlock (pre-compiled MUSL static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-fido2-bin' 'moshpit-agent-systemd-creds-bin'
           'moshpit-agent-ssh-agent-piggyback-bin' 'moshpit-agent-full-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-x86_64::${_base}/mpa-x86_64-unknown-linux-musl")
source_aarch64=("mpa-aarch64::${_base}/mpa-aarch64-unknown-linux-musl")
sha256sums=('dd21b66fbb5926de40eecab01d818b842bc396a8467803a31f0a1287b2bc58e7')
sha256sums_x86_64=('a354555b024b78195d23d36f4ea975918e02abef7a480a7b31dbc00eb4326716')
sha256sums_aarch64=('6b8531b1faea1005f0d123d1b78eb73b0604429d65ee52e71019375723a146f9')

package() {
    install -Dm755 "mpa-${CARCH}" "$pkgdir/usr/bin/mpa"

    # Man page
    install -Dm644 mpa/mpa.1 "$pkgdir/usr/share/man/man1/mpa.1"

    # Shell completions
    install -Dm644 mpa/mpa.bash \
        "$pkgdir/usr/share/bash-completion/completions/mpa"
    install -Dm644 mpa/_mpa \
        "$pkgdir/usr/share/zsh/site-functions/_mpa"
    install -Dm644 mpa/mpa.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mpa.fish"

    # systemd user units
    install -Dm644 mpa/moshpit-agent.service \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.service"
    install -Dm644 mpa/moshpit-agent.socket \
        "$pkgdir/usr/lib/systemd/user/moshpit-agent.socket"

    # Licenses
    install -Dm644 mpa/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mpa/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
