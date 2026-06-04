# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits-bin
pkgver=0.8.13
pkgrel=1
pkgdesc="moshpits server — SSH and Mosh inspired remote terminal server (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpits')
conflicts=('moshpits')
depends=('moshpit-keygen')
makedepends=()
install=moshpits.install

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mps.tar.gz" "mps.service")
source_x86_64=("mps-x86_64::${_base}/mps-x86_64-unknown-linux-musl")
source_aarch64=("mps-aarch64::${_base}/mps-aarch64-unknown-linux-musl")
# First entry is the release dist tarball; local sidecar file is intentionally SKIP.
sha256sums=('a3cccd3c8c3663e2fb4266b5d63173b3a493cca664b0e3f8039bb1d48d6f9dd4' 'SKIP')
sha256sums_x86_64=('69c8010b3591e50c29c627068007804894f5d581670d5d49804eaae1c177a772')
sha256sums_aarch64=('66afba0ffbc4789229f938852913cdef329151a0d46d2372148e352bbc3ae34b')

package() {
    install -Dm755 "mps-${CARCH}" "$pkgdir/usr/bin/mps"

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
