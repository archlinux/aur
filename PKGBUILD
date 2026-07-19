# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-bin
pkgver=0.1.0
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
source_x86_64=("rakemond-x86_64::${_base}/rakemond-x86_64-unknown-linux-musl")
source_aarch64=("rakemond-aarch64::${_base}/rakemond-aarch64-unknown-linux-musl")
# Checksums are filled in by scripts/release/update-pkgbuilds.fish before
# publishing to the AUR.
sha256sums=('58067b3eedbf4e68f6ed6adf0cfff0b38c289d631436cf9e5fa10da11ce57a4a')
sha256sums_x86_64=('a1b6885a5e4d195c9f2f402d375219abbad02cbdf716d55f44fc57b185a1ed31')
sha256sums_aarch64=('bf20350d356c3bf890d575767e118bca3c65290828bdc0150be24e7debfddf29')

package() {
    install -Dm755 "rakemond-${CARCH}" "$pkgdir/usr/bin/rakemond"

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
