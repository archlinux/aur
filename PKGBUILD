# Maintainer: Ezozbek Rasulov <arch@ezozbek.dev>
pkgname=bleur
pkgver=0.0.5
pkgrel=1
pkgdesc="That buddy that will get everything ready for you"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/bleur-org/bleur"
license=('MIT' 'Apache-2.0')
depends=('libgit2' 'libssh2' 'openssl' 'zstd' 'xz')
makedepends=('rust' 'cmake')
options=(!lto)
source=(
   "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('982e9a811175fdabf0e06c4ecff0bb70d74223af160f9c28cdcb12c5ad6c5524')

export RUSTUP_TOOLCHAIN=stable

prepare() {
    cd "$pkgname-$pkgver"

    # Fetch dependencies ahead of time
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "$pkgname-$pkgver"

    # Build release binary
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    # Install binary
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Install licenses
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
