# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: tarball <bootctl@gmail.com>

pkgname=crabz
pkgver=0.10.1
pkgrel=1
pkgdesc="Cross-platform compression and decompression tool"
arch=(x86_64)
url="https://github.com/sstadick/crabz"
license=('MIT OR Unlicense')
depends=(
    glibc
    libgcc  libgcc_s.so
)
makedepends=(cargo cmake)
changelog=CHANGELOG.md
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fb7833a83db958c8abc3b688a8905385cd19e721133ed0aa1d1dd290ef65d8f0')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/crabz -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE-MIT UNLICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
