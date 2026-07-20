# Maintainer: Jason Ozias <jason.g.ozias@pm.me>

pkgname=rakemond-unstable-bin
pkgver=0.2.9
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
sha256sums=('55095be68df2a552a589127eb9b539f2bc8065da40f5337d09e00a95301aa8d6')
sha256sums_x86_64=('44e0b20789876c428f427e6cb81ca454d86e69b28f4423f3b52c8a5a73d73694' 'b2a605c09c583c2d17f73764d66cee56a670f76cd9af36a9d2d13b90783b22de')
sha256sums_aarch64=('977e37ae820f68f807928e4ed8ea691d9382dfa654bc689993ce78bafa21bad1' '8dcb52179c4c1ddb839c36ad4323f31d116ad95018dfae74881b919c09222ccc')

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
