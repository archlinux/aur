# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-agent-full-unstable-bin
pkgver=0.8.21
pkgrel=1
pkgdesc="Moshpit agent daemon — all MUSL-portable unlock backends + post-quantum ML-DSA support (pre-compiled static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-agent')
conflicts=('moshpit-agent' 'moshpit-agent-bin' 'moshpit-agent-fido2-bin'
           'moshpit-agent-systemd-creds-bin' 'moshpit-agent-ssh-agent-piggyback-bin'
           'moshpit-agent-full-bin' 'moshpit-agent-unstable-bin' 'moshpit-agent-fido2-unstable-bin'
           'moshpit-agent-systemd-creds-unstable-bin' 'moshpit-agent-ssh-agent-piggyback-unstable-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mpa.tar.gz")
source_x86_64=("mpa-full-unstable-x86_64::${_base}/mpa-full-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mpa-full-unstable-aarch64::${_base}/mpa-full-unstable-aarch64-unknown-linux-musl")
sha256sums=('86605f2711edc0e5b9781e15d259203139e2511f23f4135b77f37424a8943e43')
sha256sums_x86_64=('05fdaec9300c30be8a34ef816fdb45dce13a13efafb7d4b1c004dd462d358c20')
sha256sums_aarch64=('c87b106f900b87f2484bb5501b8c2c27ee7b7fd6e2b23fef512d813f72d46d1b')

package() {
    install -Dm755 "mpa-full-unstable-${CARCH}" "$pkgdir/usr/bin/mpa"

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
