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
sha256sums=('6cf2ca6d77f9ada02b0059660adfa1a32ecda03490a8fd1c0e421a53db5783e2')
sha256sums_x86_64=('a2da922e8bcb9ba3f5e153c1f139366207b9e136f7ace7ceddc77a668661cf52')
sha256sums_aarch64=('66b38b8cb06960832de2fc812604c5416d9da5fe769d7780c29a6354091d9906')

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
