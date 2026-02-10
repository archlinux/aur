# Maintainer: Martin Stark <m@ayu.im>
pkgname=nvoc-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="NVIDIA GPU overclocking utility for Blackwell (RTX 50-series) on Linux"
arch=('x86_64')
url="https://github.com/martinstark/nvoc"
license=('MIT')
depends=('gcc-libs')
optdepends=('nvidia-utils: required for GPU communication via NVML')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('948ad7d0f22ba62a4653e1f1fd07a3acbad47645ab3499235949ef7b6ab4a80d')

prepare() {
    cd "nvoc-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "nvoc-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "nvoc-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "nvoc-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/nvoc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
