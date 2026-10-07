# Arch Linux PKGBUILD for ForskScope.
# makepkg downloads the source directly from GitHub's own per-tag archive
# (F43: the project's custom source archive was dropped - it duplicated
# GitHub's automatic one exactly, differing only in an omitted top-level
# directory that existed solely to suit this file's old cd "$srcdir").

pkgname=forskscope
# Keep pkgver in sync with [workspace.package] version in Cargo.toml on each release.
pkgver=0.186.0
pkgrel=1
pkgdesc="Local-first cross-platform diff and merge tool"
arch=('x86_64')
url="https://github.com/forskscope/forskscope"
license=('Apache-2.0')
# F81 is closed: F179 removed the libxdo linkage (see vendor/README.md), so
# xdotool is no longer a runtime dependency here.
depends=('webkit2gtk-4.1' 'gtk3')
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
sha256sums=('35bedec28e092b84885bfdd7015d2f276ce904860087e40861b3579a3780205f')

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
