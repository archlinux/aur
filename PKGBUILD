# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-unstable-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="System daemon that listens for cargo-rake lifecycle events and stores them in redb, built with --features unstable (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://git.jasonozias.com/rakemond.git"
license=('MIT' 'Apache-2.0')
provides=('rakemond')
conflicts=('rakemond' 'rakemond-bin')
backup=('etc/rakemond/rakemond.toml')
install=rakemond.install
options=(!strip !debug)

# rakemond's binaries are built and published locally (no CI); see
# scripts/release/ in the source repository. AUR only needs a stable,
# checksummed URL to download from — it does not care what serves it.
_base="https://git.jasonozias.com/dl/rakemond/v${pkgver}"

source=("${_base}/dist-rakemond.tar.gz")
source_x86_64=("rakemond-unstable-x86_64::${_base}/rakemond-unstable-x86_64-unknown-linux-musl")
source_aarch64=("rakemond-unstable-aarch64::${_base}/rakemond-unstable-aarch64-unknown-linux-musl")
# Checksums are filled in by scripts/release/update-pkgbuilds.fish before
# publishing to the AUR.
sha256sums=('58067b3eedbf4e68f6ed6adf0cfff0b38c289d631436cf9e5fa10da11ce57a4a')
sha256sums_x86_64=('36de3b699b66f6291f6f76392751f6795a3664e7fe02b0233263d2871e17f23b')
sha256sums_aarch64=('7cfbfdd4322abad136fe8a87235ad1c5a87acc57fb1492f2afa0621ea437db69')

package() {
    install -Dm755 "rakemond-unstable-${CARCH}" "$pkgdir/usr/bin/rakemond"

    # Man page
    install -Dm644 rakemond/rakemond.1 "$pkgdir/usr/share/man/man1/rakemond.1"

    # Shell completions
    install -Dm644 rakemond/rakemond.bash \
        "$pkgdir/usr/share/bash-completion/completions/rakemond"
    install -Dm644 rakemond/_rakemond \
        "$pkgdir/usr/share/zsh/site-functions/_rakemond"
    install -Dm644 rakemond/rakemond.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rakemond.fish"

    # systemd system unit
    install -Dm644 rakemond/rakemond.service \
        "$pkgdir/usr/lib/systemd/system/rakemond.service"

    # Example config
    install -Dm644 rakemond/rakemond.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/rakemond.toml.example"

    # Documentation
    install -Dm644 rakemond/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 rakemond/LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 rakemond/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
