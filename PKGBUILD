# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-bin
pkgver=0.8.6
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
sha256sums=('32dd85046ccf5573d5e8a95959ab12ffa65ff4e2db2428f344dd493516f042ab')
sha256sums_x86_64=('55c680f19f1d57c25d576568d1f9b8fd636c4ed19c326746b68073e343cd01da')
sha256sums_aarch64=('f2ad1462404212b7580886ca161df1c02df2c2420f208f687777cdf57d80c525')

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
