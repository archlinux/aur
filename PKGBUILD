# Maintainer: Sungjoon Moon <sumoon at seoulsaram dot org>

pkgname=unegg
pkgver=0.1.2
pkgrel=1
pkgdesc='EGG archive extractor'
arch=('x86_64')
url='https://github.com/alkegi/unegg'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/alkegi/unegg/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('96aadc42e10e7f97e36d07c6bfc75fd26ccac286d7d4e2766e7375dc4f42a60c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    RUSTFLAGS="--remap-path-prefix=$srcdir=/build/" \
        cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
