# Maintainer: nabbisen <19984221+nabbisen@users.noreply.github.com>
#
# Rendered from this template by tools/aur-render.sh (RFC 016 D-1): edit the template, not a rendered
# PKGBUILD. Only the version, pkgrel and the source checksum below are filled in; everything else is the
# real PKGBUILD.
#
# Built from the GitHub tag's source archive (RFC 016 OQ-2), so check() runs brygge's own test suite —
# the crates.io .crate omits it. Follows the Arch Wiki's "Rust package guidelines"; see the review request
# for where this deviates and why (no --all-features: brygge has none; sha256sums, not the template's
# b2sums, to match the release's own .sha256 assets).
pkgname=brygge
pkgver=0.7.0
pkgrel=1
pkgdesc="A VCS history to IR converter (Git, Mercurial, Subversion, CVS), built from source"
arch=('x86_64' 'aarch64')
url="https://github.com/prikk-vcs/brygge"
license=('Apache-2.0')
# namcap flags a Rust binary's glibc/libgcc linkage even when it is already pulled in by makedepends
# (the Arch Wiki's own note); stating them here is the fix, not a justified exception.
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
# Review 082 F-5: check() runs the full workspace suite, which genuinely spawns these real tools (not a
# false dependency, each one builds and inspects a real repository of its own kind in a decoder's own
# tests) — git (brygge-decode-git's suite, and brygge's own CLI integration tests), mercurial
# (brygge-decode-hg's suite), subversion (brygge-decode-svn's suite: svnadmin/svnlook/svnmucc/svnrdump/svn,
# all in this one package), cvs (brygge-decode-cvs's own fixture builder). The CI container installs
# exactly this list, read from .SRCINFO, so it builds the way a real AUR user's makepkg does.
checkdepends=('git' 'mercurial' 'subversion' 'cvs')
optdepends=('subversion: decode a local SVN repository (dump files need nothing)')
# namcap, on the built brygge-debug package alone, flags its build-id symlink
# (usr/lib/debug/.build-id/…) as pointing to a non-existing ../../../../bin/brygge: the target is real,
# it just lives in the main brygge package, which namcap does not see when it inspects brygge-debug in
# isolation. Justified exception, not a bug (review 082/request 054). This package keeps makepkg's normal
# strip/debug options, unlike brygge-bin (review 084 D-2): a from-source build's own debug data is useful
# to split out, where a prebuilt release binary's isn't.
source=("$pkgname-$pkgver.tar.gz::https://github.com/prikk-vcs/brygge/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('912698a94be394213503ba9b896c54d059ac8f5fa8eab2a36eaef0b48bcde685')

prepare() {
    cd "$pkgname-$pkgver"
    # Pins the toolchain against a user's own rustup default (Rust package guidelines); brygge has no
    # rust-toolchain.toml, so this is not redundant with one.
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # -p brygge, not --all-features: the workspace's other crates (the decoders, brygge-ir) are brygge's
    # own dependencies, built as a side effect; brygge has no Cargo features to select.
    cargo build --frozen --release -p brygge
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # --workspace, not --all-features (this is a cargo workspace; see the guidelines' own note for that
    # shape): runs every crate's test suite, matching what CI runs on every push.
    cargo test --frozen --workspace
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
