pkgname=mycelium
pkgver=0.7.9
pkgrel=1
pkgdesc="Mycelium end-2-end encrypted IPv6 overlay network"
url='https://github.com/threefoldtech/mycelium'
license=('GPL')
makedepends=('cargo')
depends=()
arch=('x86_64')
options=('!lto') # lto, if set, causes the build to fail on linking ring C artifacts if using the default linker
source=("https://github.com/threefoldtech/mycelium/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ad421a4c6aac36329b13344e34265798d3751d220b10e8e724065d1e6d64bdad')

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
