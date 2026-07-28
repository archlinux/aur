# Maintainer: Luis Ortiz <luis.ortiz@westpoint.io>
pkgname=lazyrsync
pkgver=0.2.0
pkgrel=1
pkgdesc="A terminal UI for rsync — profiles, dry-run diff preview, live progress"
arch=('x86_64' 'aarch64')
url="https://github.com/westpoint-io/lazyrsync"
license=('MIT')
depends=('rsync' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4ce106e10a258ccb4fdf8958b49746f7a1f9386592ede441f620a7f41ffb7d75')

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
