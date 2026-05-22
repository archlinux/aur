# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits-unstable-bin
pkgver=0.8.6
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
sha256sums=('31038dd5acc81e8ced394aeab8078a62d65aeb0b3f8697cecb44f6c5239a27b4' 'SKIP')
sha256sums_x86_64=('5ca02826e2b0a702ff729132aa882c1207d1b6dabf34e90e8a2e71d9ccd6c0ae')
sha256sums_aarch64=('0adaa9b59d22cfb83a9b794761d73c9bf1710d16abbd2a9cfbb6e1f78e465496')

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
