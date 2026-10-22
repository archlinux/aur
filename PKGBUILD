# Maintainer: Luis Ortiz <luis.ortiz@westpoint.io>
pkgname=lazyrsync
pkgver=0.4.0
pkgrel=1
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"
arch=('x86_64' 'aarch64')
url="https://github.com/westpoint-io/lazyrsync"
license=('MIT')
depends=('rsync' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e8995ca91c75dc67d88ad4e09f74a2f7863387262b63ee299833a4f9d4c7de3c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
