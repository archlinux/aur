# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=topiary
pkgver=0.2.3
pkgrel=1
pkgdesc='The universal code formatter'
arch=('x86_64')
url='https://topiary.tweag.io/'
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(cargo)
provides=(topiary)
conflicts=(topiary)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/tweag/topiary/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
    '880414f2a71ccbff334f25ae58db63ce7efaba78d00644bb9754056b637a4b73'
)

prepare() {
    cd "$pkgname-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
        cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
    CARGO_TARGET_DIR=target \
    TOPIARY_LANGUAGE_DIR="/usr/share/$pkgname/languages" \
        cargo build --frozen --release --all-features --bin topiary
}

check() {
    cd "$pkgname-$pkgver"

    RUSTUP_TOOLCHAIN=stable \
        cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm0755 -t "$pkgdir/usr/share/$pkgname/languages/" languages/*.scm
}
