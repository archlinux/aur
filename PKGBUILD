# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-unstable-bin
pkgver=0.4.4
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
source_x86_64=(
    "rakemond-unstable-x86_64::${_base}/rakemond-unstable-x86_64-unknown-linux-musl"
    "rmdq-x86_64::${_base}/rmdq-x86_64-unknown-linux-musl"
)
source_aarch64=(
    "rakemond-unstable-aarch64::${_base}/rakemond-unstable-aarch64-unknown-linux-musl"
    "rmdq-aarch64::${_base}/rmdq-aarch64-unknown-linux-musl"
)
# Checksums are filled in by scripts/release/update-pkgbuilds.fish before
# publishing to the AUR. sha256sums_x86_64/sha256sums_aarch64 each have two
# elements, matching source_x86_64/source_aarch64's order (rakemond, rmdq).
sha256sums=('8cc2a4d23286d4f940be859676c149835b46d8535778d5de232d70dd84f5642d')
sha256sums_x86_64=('45b88febf3b496164103b9319bbfba8e2650948117afdec25a4768657039e646' '94c0f9a7f7d59ffacc43b45ee5c63afc089e1cbef4d4335f24fa4615ee2fd89a')
sha256sums_aarch64=('9b6e8ab81b441c9cf088fbd57060efa0b7028a2ce7e580cfb7de1e21062cc280' '18956c4422e94db111a880927a7580bd683145e754dedf0c2c6acfee77d84e5a')

package() {
    install -Dm755 "rakemond-unstable-${CARCH}" "$pkgdir/usr/bin/rakemond"
    install -Dm755 "rmdq-${CARCH}" "$pkgdir/usr/bin/rmdq"

    # Man pages
    install -Dm644 rakemond/rakemond.1 "$pkgdir/usr/share/man/man1/rakemond.1"
    install -Dm644 rmdq/rmdq.1 "$pkgdir/usr/share/man/man1/rmdq.1"

    # Shell completions
    install -Dm644 rakemond/rakemond.bash \
        "$pkgdir/usr/share/bash-completion/completions/rakemond"
    install -Dm644 rakemond/_rakemond \
        "$pkgdir/usr/share/zsh/site-functions/_rakemond"
    install -Dm644 rakemond/rakemond.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rakemond.fish"
    install -Dm644 rmdq/rmdq.bash \
        "$pkgdir/usr/share/bash-completion/completions/rmdq"
    install -Dm644 rmdq/_rmdq \
        "$pkgdir/usr/share/zsh/site-functions/_rmdq"
    install -Dm644 rmdq/rmdq.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/rmdq.fish"

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
