# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemon-unstable-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal dashboard for cargo-rake lifecycle events (pre-compiled binary, unstable build)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/rakemon"
license=('custom')
provides=('rakemon')
conflicts=('rakemon')
makedepends=()
options=(!strip !debug)

# rakemon's source repository is private; binaries and the dist sidecar
# bundle are mirrored to the public rustyhorde/rakemon-packages repo on every
# release specifically so anonymous AUR build servers can fetch them.
_base="https://github.com/rustyhorde/rakemon-packages/releases/download/v${pkgver}"

source=("${_base}/dist-rakemon.tar.gz")
source_x86_64=("rakemon-unstable-x86_64::${_base}/rakemon-unstable-x86_64-unknown-linux-musl")
source_aarch64=("rakemon-unstable-aarch64::${_base}/rakemon-unstable-aarch64-unknown-linux-musl")
# Checksums are filled in by the release workflow before publishing to the AUR.
sha256sums=('28ea96a3c3c1666197fff19863845e5ddbf57eec3c84800b7a7a348e27035319')
sha256sums_x86_64=('b67e9b39e6d5002e9e1453db586c5eede7e004f9a4e12889c7294b5d12999e86')
sha256sums_aarch64=('89ecbafa65c2d47bb7dceb0a29d7a71ce0ed068404434f7e914a8ca1f3045ff5')

package() {
    install -Dm755 "rakemon-unstable-${CARCH}" "$pkgdir/usr/bin/rakemon"

    # Man page
    install -Dm644 rakemon/rakemon.1 "$pkgdir/usr/share/man/man1/rakemon.1"

    # Shell completions
    install -Dm644 rakemon/rakemon.bash \
        "$pkgdir/usr/share/bash-completion/completions/rakemon"
    install -Dm644 rakemon/_rakemon \
        "$pkgdir/usr/share/zsh/site-functions/_rakemon"
    install -Dm644 rakemon/rakemon.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rakemon.fish"

    # Documentation
    install -Dm644 rakemon/README.md \
        "$pkgdir/usr/share/doc/$pkgname/README.md"

    # License
    install -Dm644 rakemon/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
