# Arch Linux PKGBUILD for ForskScope.
# makepkg downloads the source directly from GitHub's own per-tag archive
# (F43: the project's custom source archive was dropped - it duplicated
# GitHub's automatic one exactly, differing only in an omitted top-level
# directory that existed solely to suit this file's old cd "$srcdir").

pkgname=forskscope
# Keep pkgver in sync with [workspace.package] version in Cargo.toml on each release.
pkgver=0.169.0
pkgrel=1
pkgdesc="Local-first cross-platform diff and merge tool"
arch=('x86_64')
url="https://github.com/forskscope/forskscope"
license=('Apache-2.0')
# F81: xdotool provides libxdo, which the binary links (see F44) - without it
# the package builds and installs cleanly and then fails to start. Temporary:
# the upstream dioxus fix (DioxusLabs/dioxus#5749) drops the libxdo linkage
# entirely, and this dependency should be removed once that release is taken.
depends=('webkit2gtk-4.1' 'gtk3' 'xdotool')
makedepends=('cargo' 'pkg-config' 'openssl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/forskscope/forskscope/archive/refs/tags/$pkgver.tar.gz")
# SKIP is a real gap, not an oversight: F43 switched this from a local file
# (no network, nothing to distrust) to a network fetch, and no real release
# tag exists yet to hash against - any value written now would be wrong the
# moment a real tag is cut. Before or at each release, run `updpkgsums` (or
# `sha256sum` the actual tag tarball) against the real, tagged $pkgver and
# commit the resulting hash here; do not leave SKIP once a real tag exists.
sha256sums=('6fedc21ebec1e3b8aae1dc2275fb21d80a325c8d7c5bf8fa3e8ff4c7c9b320cb')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/forskscope" "$pkgdir/usr/bin/forskscope"
    install -Dm644 "packaging/linux/forskscope.desktop" \
        "$pkgdir/usr/share/applications/forskscope.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "NOTICE" "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
