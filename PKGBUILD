# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits-unstable-bin
pkgver=0.8.16
pkgrel=1
pkgdesc="moshpits server with post-quantum support — SSH and Mosh inspired remote terminal server (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpits')
conflicts=('moshpits' 'moshpits-bin')
replaces=('moshpits-bin')
depends=('moshpit-keygen')
makedepends=()
install=moshpits.install

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mps.tar.gz" "mps.service")
source_x86_64=("mps-unstable-x86_64::${_base}/mps-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mps-unstable-aarch64::${_base}/mps-unstable-aarch64-unknown-linux-musl")
# First entry is the release dist tarball; local sidecar file is intentionally SKIP.
sha256sums=('dc4104bbe1f44f9494ea1796478f5b3315773bd720a2cf93add58afba9f8a633' 'SKIP')
sha256sums_x86_64=('29721480b61e2648992c39e7b150df49990ad2f338ae5f6c4853c77011bb6e5d')
sha256sums_aarch64=('88d9b7f1432b6ba9dc578a23ba6e6654404de994ef8d86ba75a7d1b8f7498924')

package() {
    install -Dm755 "mps-unstable-${CARCH}" "$pkgdir/usr/bin/mps"

    # Man page
    install -Dm644 mps/mps.1 "$pkgdir/usr/share/man/man1/mps.1"

    # Shell completions
    install -Dm644 mps/mps.bash \
        "$pkgdir/usr/share/bash-completion/completions/mps"
    install -Dm644 mps/_mps \
        "$pkgdir/usr/share/zsh/site-functions/_mps"
    install -Dm644 mps/mps.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mps.fish"

    # systemd unit
    install -Dm644 "$srcdir/mps.service" \
        "$pkgdir/usr/lib/systemd/system/mps.service"

    # Example config
    install -Dm644 mps/moshpits.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/moshpits.toml.example"

    # Licenses
    install -Dm644 mps/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mps/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
