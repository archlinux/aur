pkgname=raindrops
pkgver=0.1.0
pkgrel=1
pkgdesc="An aesthetic rain CLI program written in Rust"
arch=('x86_64')
url="https://github.com/execRooted/raindrops"
license=('MIT')
depends=()
makedepends=('rust')
source=("https://github.com/execRooted/raindrops/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$srcdir/raindrops-${pkgver}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/raindrops-${pkgver}"
    install -Dm755 target/release/raindrops "$pkgdir/usr/bin/raindrops"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}


