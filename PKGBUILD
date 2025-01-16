# Maintainer: John Regan <john@jrjrtech.com>

pkgname=lightningcss
pkgver=1.29.0
pkgrel=1
pkgdesc='An extremely fast CSS parser, transformer, bundler, and minifier written in Rust.'
url='https://lightningcss.dev/'
arch=('i686' 'x86_64')
license=('MPL-2.0')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/parcel-bundler/lightningcss/archive/v$pkgver.tar.gz")
sha256sums=('01fa5f9981967cbb212efdd4235c1f652a646df40636efffbd724d62ce58c327')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --features "cli" --release --frozen

}

check() {
    cd "$pkgname-$pkgver"
    cargo test --features "cli" --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

