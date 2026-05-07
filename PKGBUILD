# Maintainer: Zachary M <minein12 at protonmail dot com>

pkgname='noita_proxy'
pkgver=1.6.2
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
    'bzip2'
)
makedepends=(
    'rust'
    'jack'
)
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "noita_proxy.desktop"
)
sha256sums=('91d3776fb6e779e35fc26805941d88fbfbbbcbed79719db737972bf25626a5b3'
            '512c06c20b86cd51188f883904efc7f48d59b852ee5607a80b11337a92ca1899')
install=${pkgname}.install
# Build fails with lto enabled
options=(!lto)

build() {
    cd "noita_entangled_worlds-${pkgver}/noita-proxy"
    cargo build -r
}

package() {
    cd "noita_entangled_worlds-${pkgver}"

    install -Dm 644 LICENSE-APACHE \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 644 LICENSE-MIT \
        -t "$pkgdir/usr/share/licenses/$pkgname"

    install -Dm 755 noita-proxy/target/release/noita-proxy \
        -t "$pkgdir/usr/lib/noita_proxy"

    install -Dm 644 redist/libsteam_api.so \
        -t "$pkgdir/usr/lib/noita_proxy"

    install -Dm 644 ../noita_proxy.desktop \
        -t "$pkgdir/usr/share/applications"

    install -Dm 644 noita-proxy/assets/icon.png \
        -T "$pkgdir/usr/share/icons/noita_proxy.png"

    printf '#!/usr/bin/env sh\nexec /usr/lib/noita_proxy/noita-proxy $@' | \
        install -Dm 755 /dev/stdin "$pkgdir/usr/bin/noita_proxy"
}
