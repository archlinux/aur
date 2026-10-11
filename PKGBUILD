# Maintainer: Alexander Inglessi <inglessi glsk net>

pkgname=redukt
pkgver=0.1.3
pkgrel=1
pkgdesc="Command-line tool for redacting sensitive data"
arch=('x86_64' 'aarch64')
url="https://git.glsk.net/glsk/redukt"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('962c1871a769c32310f1def8a423f11e6d72502b9d3e3c8dae57a4fe506979c0')

prepare() {
    cd "$pkgname"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm0644 presets/sample.yaml -t "$pkgdir/usr/share/doc/$pkgname/"
}
