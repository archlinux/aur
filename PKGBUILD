# Maintainer: Tanmay Chaudhry <tanmay.chaudhry@gmail.com>
pkgname=envyr
pkgver=0.4.2
pkgrel=1
pkgdesc="Automagically package and run applications in sandboxed environments"
arch=('x86_64' 'aarch64')
url="https://github.com/tchaudhry91/envyr"
license=('Apache-2.0')
depends=('git')
optdepends=('docker: for Docker executor' 'podman: for Docker executor (alternative)')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('82fd8b961b697ab7964054ca0817094bffac313537ef309af461918fc9c24375')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/envyr" "$pkgdir/usr/bin/envyr"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
