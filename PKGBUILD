# Maintainer: Alexander Inglessi <inglessi glsk net>

pkgname=redukt
pkgver=0.1.2
pkgrel=1
pkgdesc="Command-line tool for redacting sensitive data"
arch=('x86_64' 'aarch64')
url="https://git.glsk.net/glsk/redukt"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3f14a0eaf026450c1220047fc9c3abd3e78a11decac90c9c870ad99f1b3acacc')

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
