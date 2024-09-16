# Maintainer: crimist <aur at crim dot ist>

pkgname=nvidia_oc
pkgver=0.1.12
pkgrel=1
pkgdesc="A simple cli overclocking tool for Nvidia GPUs that supports both X11 and Wayland"
arch=('any')
url="https://github.com/Dreaming-Codes/nvidia_oc"
license=('MIT')
makedepends=('cargo')
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('71a00d72760789a28914b8ee05349c7ae787917c5111e10c05cfae93f6da03ad5c177a9b89d7de7d26c7b4548d0dd245eb4c08d7f384e436df035a55e994cd4f')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "${srcdir}/$pkgname-$pkgver/target/release/$pkgname"
}
