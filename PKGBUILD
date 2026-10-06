# Arch Linux PKGBUILD for ForskScope.
# makepkg downloads the source directly from GitHub's own per-tag archive
# (F43: the project's custom source archive was dropped - it duplicated
# GitHub's automatic one exactly, differing only in an omitted top-level
# directory that existed solely to suit this file's old cd "$srcdir").

pkgname=forskscope
# Keep pkgver in sync with [workspace.package] version in Cargo.toml on each release.
pkgver=0.181.0
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
# SKIP here is permanent, not a gap to close before the next release
# (RFC-081): pkgver above names an unreleased version for nearly this
# file's entire life, since cargo xtask version-sync ties it to the
# workspace version and the workspace bumps immediately after each tag.
# There is essentially never a tagged tarball in the tree to hash. The
# real hash is computed at publish time by .github/workflows/aur-publish.yml,
# straight from the released tag's archive, and written only into the
# copy of this file that workflow pushes to the AUR - never committed
# here. This file is a template; do not copy it and run `makepkg -si`
# expecting a verified download (see docs/src/users/installation.md's
# Arch section for the supported path).
sha256sums=('0cb121d3ed7dda775a8e9ac21064e530fb936cca6d026eca51ca2d93b1ea1bc1')

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
