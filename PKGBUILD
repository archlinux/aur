# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-bin
pkgver=0.8.9
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
sha256sums=('6c2ced77cbc4051cd55c28ed03a540572971039f2fa5faab6269fbec0d54e434')
sha256sums_x86_64=('a470f42d5476edd0fcf0eeaa772622d231dc53afeb0f3f2afb51e83805c46e85')
sha256sums_aarch64=('601a9ac88736d02e9e5d0fc280d3d2a6d96443927e8fff698e14bf5d00288323')

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
