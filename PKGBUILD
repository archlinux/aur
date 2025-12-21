pkgname=mycelium
pkgver=0.7.0
pkgrel=1
pkgdesc="Mycelium end-2-end encrypted IPv6 overlay network"
url='https://github.com/threefoldtech/mycelium'
license=('GPL')
makedepends=('cargo')
depends=()
arch=('x86_64')
source=("https://github.com/threefoldtech/mycelium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6b839c13fd9174d0c056c6ccd4afe2a55c32829eee7b4f4c951e8ada8d2539ec')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    pushd "mycelium-${pkgver}/myceliumd"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    popd
    pushd "mycelium-${pkgver}/myceliumd-private"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    popd
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    pushd "mycelium-${pkgver}/myceliumd"
    cargo build --frozen --release --all-features
    popd
    pushd "mycelium-${pkgver}/myceliumd-private"
    cargo build --frozen --release --all-features
    popd
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    pushd "mycelium-${pkgver}/myceliumd"
    cargo test --frozen --all-features
    popd
    pushd "mycelium-${pkgver}/myceliumd-private"
    cargo test --frozen --all-features
    popd
}

package() {
    pushd "mycelium-${pkgver}/myceliumd"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mycelium"
    popd
    pushd "mycelium-${pkgver}/myceliumd-private"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/mycelium-private"
    popd
}
