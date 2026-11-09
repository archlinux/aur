# Maintainer: asafelobotomy <213836723+asafelobotomy@users.noreply.github.com>

# The AUR name `crumbs` belongs to an unrelated tool; this package installs
# crumBS as /usr/bin/crumbs, so it conflicts with that one.
pkgname=crum-bs
_pkgname=crumbs
pkgver=0.3.0
pkgrel=1
pkgdesc="Find and remove app leftovers, caches and system bloat"
arch=('x86_64')
url="https://github.com/asafelobotomy/crumbs"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('crumbs')
# Rust's own LTO is set in the release profile.
options=('!lto')
# The release uploads this tarball (git archive of the tag).
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('4feeae4526d44b8d60e6ee30fa234a1a17d17b4ded7e53e0661484ebf87c7c47')

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
}
