# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemon-unstable-bin
pkgver=0.1.0
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
sha256sums=('948c269492046c33412ae1b9fdc3759866877ff18d45f0152d98ec85fc5fd9ed')
sha256sums_x86_64=('053a6d9094727b1b2e31d0cd643a29426b1e35b91e87dc1ba6ac19c37b999edc')
sha256sums_aarch64=('86c54f9892475157299317b47332963c6c9c3b22c3b7fd9a7f85a36431f0ec81')

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
