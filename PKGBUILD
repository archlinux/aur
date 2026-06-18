# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits-bin
pkgver=0.9.1
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
sha256sums=('579a6729bd7cc3cf1009a6b2165432e37dedea0e2669b33d1fa587a9a855a693' 'SKIP')
sha256sums_x86_64=('2310e70220faa93779da11b23bdf5637113f1e64b4c6ac1b4c5b7d6b6c8ee007')
sha256sums_aarch64=('f92ffdcb570c5d14408e3d59b81ba7011484fb218ca91f85e091c06ab4fc8366')

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
