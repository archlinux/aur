# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-bin
pkgver=0.4.1
pkgrel=1
pkgdesc="System daemon that listens for cargo-rake lifecycle events and stores them in redb (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://git.jasonozias.com/rakemond.git"
license=('MIT' 'Apache-2.0')
provides=('rakemond')
conflicts=('rakemond' 'rakemond-unstable-bin')
backup=('etc/rakemond/rakemond.toml')
install=rakemond.install
options=(!strip !debug)

# rakemond's binaries are built and published locally (no CI); see
# scripts/release/ in the source repository. AUR only needs a stable,
# checksummed URL to download from — it does not care what serves it.
_base="https://git.jasonozias.com/dl/rakemond/v${pkgver}"

source=("${_base}/dist-rakemond.tar.gz")
source_x86_64=(
    "rakemond-x86_64::${_base}/rakemond-x86_64-unknown-linux-musl"
    "rmdq-x86_64::${_base}/rmdq-x86_64-unknown-linux-musl"
)
source_aarch64=(
    "rakemond-aarch64::${_base}/rakemond-aarch64-unknown-linux-musl"
    "rmdq-aarch64::${_base}/rmdq-aarch64-unknown-linux-musl"
)
# Checksums are filled in by scripts/release/update-pkgbuilds.fish before
# publishing to the AUR. sha256sums_x86_64/sha256sums_aarch64 each have two
# elements, matching source_x86_64/source_aarch64's order (rakemond, rmdq).
sha256sums=('70fb77f75f39e2fb2494f208d447cd555bb57f8875803a672ae1ffbf940ec55a')
sha256sums_x86_64=('be18f9ef4b9324f5fd8550d2ec4b529dd448956bcf670e000725efd2ce1f71f2' '16b4b3bea265fc9dd8794a26f25d4d4a5c96487eaa352bf4063f30d245209e7e')
sha256sums_aarch64=('8da644eee0f76f8e6d8ce81c23e4281eaa4dcba9261c22a3763c2f37b6029ac4' '6789bf66ada91735d2da791de85fb6b35bd56ba161b2436bd9d64c5b2f0e9a85')

package() {
    install -Dm755 "rakemond-${CARCH}" "$pkgdir/usr/bin/rakemond"
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
