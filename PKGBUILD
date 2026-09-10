# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname='noita_proxy'
pkgver=1.6.4
pkgrel=1
pkgdesc='Noita Entangled Worlds mod'
url='https://github.com/IntQuant/noita_entangled_worlds'
arch=('x86_64')
license=(
    'MIT'
    'Apache-2.0'
)
depends=(
    'sh'
    'alsa-lib'
    'openssl'
    'opus'
)
makedepends=(
    'cargo'
    'jack'
)
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "noita_proxy.desktop"
)
sha256sums=('7df00c5f3adf9ee75b659fcd9e7f81b0afadbb116c1a518a66e667241cc7e566'
            '512c06c20b86cd51188f883904efc7f48d59b852ee5607a80b11337a92ca1899')
install=${pkgname}.install

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "noita_entangled_worlds-${pkgver}/noita_proxy"
    cargo fetch --locked --target host-tuple
}

build() {
    export CFLAGS+=" -ffat-lto-objects"
    export CXXFLAGS+=" -ffat-lto-object"

    cd "noita_entangled_worlds-${pkgver}/noita_proxy"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "noita_entangled_worlds-${pkgver}/noita_proxy"
    cargo test --frozen --all-features
}

package() {
    cd "noita_entangled_worlds-${pkgver}"

    install -Dm 644 LICENSE-APACHE \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 644 LICENSE-MIT \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 755 noita_proxy/target/release/noita_proxy \
        -t "$pkgdir/usr/lib/noita_proxy"

    install -Dm 644 redist/libsteam_api.so \
        -t "$pkgdir/usr/lib/noita_proxy"

    install -Dm 644 ../noita_proxy.desktop \
        -t "$pkgdir/usr/share/applications"

    install -Dm 644 noita_proxy/assets/icon.png \
        -T "$pkgdir/usr/share/icons/noita_proxy.png"

    printf '#!/usr/bin/env sh\nexec /usr/lib/noita_proxy/noita_proxy $@' | \
        install -Dm 755 /dev/stdin "$pkgdir/usr/bin/noita_proxy"
}
