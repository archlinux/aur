# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-unstable-bin
pkgver=0.8.10
pkgrel=1
pkgdesc="Moshpit agent daemon — passphrase unlock with post-quantum ML-DSA support (pre-compiled MUSL static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin'
           'moshpit-agent-full-bin' 'moshpit-agent-fido2-unstable-bin'
           'moshpit-agent-systemd-creds-unstable-bin' 'moshpit-agent-ssh-agent-piggyback-unstable-bin'
           'moshpit-agent-full-unstable-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-unstable-x86_64::${_base}/mpa-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mpa-unstable-aarch64::${_base}/mpa-unstable-aarch64-unknown-linux-musl")
sha256sums=('d673d7b1f55a10e6204a86fe7d941da2fbe07ef02c8fa419b1df9b9bac1accfe')
sha256sums_x86_64=('3c7811dedfd576044b9b5ba06cfc3a691417ce05ca01fe813edc8c9ff77fff01')
sha256sums_aarch64=('8a9bf32efca60092d8d5858e40fee040404ba32c28ea747dd88fca2916effa0f')

package() {
    install -Dm755 "mpa-unstable-${CARCH}" "$pkgdir/usr/bin/mpa"

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
