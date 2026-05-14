# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=waybound
pkgver=0.1.0
pkgrel=1
pkgdesc='Hot boundaries (corners and edges) for wayland'
arch=(x86_64)
url=https://github.com/ralphptorres/waybound
license=(MIT)

depends=(wayland)
makedepends=(cargo wayland-protocols)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(31ca0e0636d4d8cee4bb2a13c00097220e083443e6acd47c78db63dbf82f78b3)
options=(!strip !debug)

prepare() {
    cd "$srcdir"/$pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir"/$pkgname-$pkgver
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --offline
}

package () {
    cd "$srcdir"/$pkgname-$pkgver
    install -Dm755 -t "$pkgdir"/usr/bin target/release/$pkgname
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname license.txt
    install -Dm644 -t "$pkgdir"/usr/share/doc/$pkgname readme.md changelog.md
}
