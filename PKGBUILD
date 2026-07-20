# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-bin
pkgver=0.2.5
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
sha256sums=('7cd59085dc6c841a50eba094b349daf92358a09d4a42a3577a6dd9c7cce3e058')
sha256sums_x86_64=('26d27579ea81975a01bf1f021ace8efe1f72b4a79f5ce5dd83077478dc2d1a76' '5d62d01cccf2df74c368fab6de9042b6c6dcdb9272a82313fa42cfa3c525ebc0')
sha256sums_aarch64=('63d6d64a111938d785631a79b6515c528e936b6a1a5d27a89b6de21399dd8b86' '690e69cfe088a3ba55ffa8bfeb6b34e3544b70faf04f07693b5956cc8ed27a2d')

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
