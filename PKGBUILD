# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpits-unstable-bin
pkgver=0.9.3
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
sha256sums=('8af079ff84260fb8a1538ccb8748cd1535e02fee967eae48a5dba7fb83de002b' 'SKIP')
sha256sums_x86_64=('a0588e547e5966fb23aa411fc8ba0b50fc697aec59397b74023c2e19125ab81f')
sha256sums_aarch64=('0f1a5e352e684a175c5c1290a26eee9947a944d44a1adfdfff4d77cd48874ed2')

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
