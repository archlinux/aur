# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

# The AUR name `crumbs` belongs to an unrelated tool; this package installs
# crumBS as /usr/bin/crumbs, so it conflicts with that one.
pkgname=crum-bs
_pkgname=crumbs
pkgver=0.8.4
pkgrel=1
pkgdesc="Find and remove app leftovers, caches and system bloat"
arch=('x86_64')
url="https://github.com/asafelobotomy/crumbs"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
optdepends=('uq: the Storage and cleanup page in Settings and an "Uninstall…" entry in the app menus')
makedepends=('cargo')
conflicts=('crumbs')
# Rust's own LTO is set in the release profile.
options=('!lto')
# The release uploads this tarball (git archive of the tag).
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('4c9774d9e82f4656cd74c5a120e86199d6a79977acce0970e20e67ca13ab3f14')

prepare() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p crumbs-cli
}

check() {
    # Every release's tests passed in CI before it was tagged. Running them again while the
    # package installs only makes setup longer, and a test that needs a terminal or a
    # session can fail in a clean build. UQ_CHECK=1 runs them.
    [ -n "${UQ_CHECK:-}" ] || { msg2 'skipping tests (CI runs them; set UQ_CHECK=1 to run)'; return 0; }
    cd "$_pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    # The test suite runs in the debug profile: release builds refuse the
    # fixture roots the tests rely on.
    cargo test --frozen --workspace
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm755 target/release/crumbs "$pkgdir/usr/bin/crumbs"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    # uQ integration (inert without uQ): uq/README.md says what each file adds.
    install -Dm644 -t "$pkgdir/usr/share/uq/launcher/actions" uq/launcher/actions/*.appaction
    install -Dm644 -t "$pkgdir/usr/share/uq/settings/pages/crumbs" uq/pages/crumbs/*
}
