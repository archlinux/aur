# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=catenary
pkgver=2.1.2
pkgrel=1
pkgdesc="LSP-powered code intelligence for AI coding agents"
arch=('x86_64')
url="https://github.com/TwoWells/Catenary"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
provides=('catenary')
conflicts=('catenary-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TwoWells/Catenary/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2174534eaea7c5d2e9ecc5356a02da305e81ca64428ad50eda757caaf59b3bd1')

# The GitHub archive extracts to Catenary-$pkgver/ (the repo name is
# capitalized). The workspace's catenary-proc library crate is in-tree
# (crates/catenary-proc), so the build needs no crates.io copy of it.
_srcdir="Catenary-$pkgver"

# No check(): the integration suite spawns daemons, language servers, and
# Unix sockets under XDG dirs — not chroot-friendly. CI upstream runs the
# full 3300-test matrix on every commit; the package build is not the place
# to rerun it.

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
    install -Dm755 "target/release/catenary" "$pkgdir/usr/bin/catenary"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
