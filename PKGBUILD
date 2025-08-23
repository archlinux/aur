# Maintainer: magnap <echo "bXJvazRhQGdtYWlsLmNvbQo=" | base64 -d>
pkgname=cyan-skillfish-governor
pkgver=0.1.3
pkgrel=1
pkgdesc="GPU governor for the AMD Cyan Skillfish APU"
arch=('x86_64')
url="https://github.com/Magnap/$pkgname"
license=('MIT')
depends=('libdrm')
makedepends=('cargo')
backup=("etc/$pkgname/config.toml")
source=("https://github.com/Magnap/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('9cc5d46f9878db63eff2cc3a7088474482a06a0ffe073677ec759cdc30785bebf1bdf7ca4f66677d200e47d709ad14e2e52ee2976217592ca16bee267341adc3')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 default-config.toml "$pkgdir/etc/$pkgname/config.toml"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" "$pkgname.service"
}
