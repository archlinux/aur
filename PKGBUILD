# Maintainer: Axel Denis <axel.denis@epitech.eu>
# Maintainer: Julian Scott <julian.scott@epitech.eu>
# Maintainer: Ludovic De Chavagnac <ludovic.de-chavagnac@epitech.eu>
# Maintainer: Arthur Aillet <arthur.aillet@epitech.eu>

pkgname=wormhole
pkgver=0.1.0
pkgrel=1
pkgdesc='Simple decentralized file storage'
url='https://github.com/Agartha-Software/Wormhole'
license=('AGPL-3.0-only')
makedepends=(cargo git)
depends=(fuse3 gcc-libs)
arch=('x86_64')
source=('git+https://github.com/Agartha-Software/Wormhole.git#commit=f709c6897238bf735a61f277b5cd2ab397490e21')
b2sums=("SKIP") # will be added once we point a real release

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd Wormhole
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd Wormhole
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd Wormhole
    cargo test --frozen --all-features
}

package() {
    cd Wormhole
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}