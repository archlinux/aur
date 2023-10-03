# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=topiary
pkgver=0.3.0
pkgrel=1
pkgdesc='The universal code formatter'
arch=('x86_64')
url='https://topiary.tweag.io/'
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(cargo)
provides=(topiary)
conflicts=(topiary)

source=("$pkgname-$pkgver.tar.gz::https://github.com/tweag/topiary/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3baa3fdd4fbc167bbd9c6eb87650d14ba0f6717806cb4b7f254dee8d0c77fb07')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export TOPIARY_LANGUAGE_DIR="/usr/share/$pkgname/queries"

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    cargo build --frozen --release --all-features --bin topiary
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0755 -t "$pkgdir$TOPIARY_LANGUAGE_DIR/" queries/*.scm
}
