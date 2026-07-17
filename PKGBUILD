# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=lattice-markdown
pkgver=0.6.0
pkgrel=1
pkgdesc="Markdown predicate linter and backlink reconciler, shipped as an LSP server"
arch=('x86_64')
url="https://github.com/TwoWells/Lattice"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
# The unrelated AUR packages `lattice` and `lattice-bin` also install a
# /usr/bin/lattice, so the file conflict is declared explicitly.
conflicts=('lattice-markdown-bin' 'lattice' 'lattice-bin')
# The upstream project (and its binary) is plain `lattice`; the pkgname carries
# the -markdown suffix only because the AUR name is taken.
source=("lattice-$pkgver.tar.gz::https://github.com/TwoWells/Lattice/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c1f87a67feaa10ae7c4ad195982f58b3d919c86464ad02d486075ff19d00abd')

# The GitHub archive extracts to Lattice-$pkgver/ (the repo name is capitalized).
_srcdir="Lattice-$pkgver"

prepare() {
    cd "$_srcdir"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/lattice" "$pkgdir/usr/bin/lattice"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
