# Maintainer: Ralph Torres <mail at ralphptorr dot es>

pkgname=waybound
pkgver=0.1.1
pkgrel=1
pkgdesc='Hot boundaries (corners and edges) for wayland'
arch=(x86_64)
url=https://github.com/ralphptorres/waybound
license=(MIT)

depends=(wayland)
makedepends=(cargo wayland-protocols)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=(6fc5c77caa241404fc7e928e61c08e1e5f5fa921dccde390f28b8c68f873e58f)
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
