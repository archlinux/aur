# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.2.7
pkgrel=2
pkgdesc="An offline build planner for Path of Exile using the cross-platform 'rusty-path-of-building' runtime"
url='https://github.com/meehl/rusty-path-of-building'
license=('MIT')
makedepends=('cargo' 'git' 'zlib')
depends=('desktop-file-utils' 'luajit' 'lua51-curl' 'lua51-luautf8' 'lua51-socket')
arch=('x86_64')
provides=("rusty-path-of-building")
# LTO causes problems with 'ring' (dependency of ureq)
options=('!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meehl/rusty-path-of-building/archive/v${pkgver}.tar.gz"
    "rusty-path-of-building-1.desktop"
    "rusty-path-of-building-2.desktop"
)
b2sums=('41b74c2e5bab1b97c57488e89bb3eb151f5a00a051dd3ef6dae3749992d65be8ebbe6fea867892f26e8a6f0d3154553d0f7513a6429e13b982c436c567221335'
        'd94331a4f795395a581a0bac7339fa0c444b96271f8ac9245b2e6e0f8a9a3e8a885c917b25e5b952edb2e616522c7dd5a8b560f0275452f64999ea1b5c53110e'
        '0b1331dfaba5d5e767a8ca9b8919ccff22b7c3591f4e5b375c96257e45a3abc9a947b1e6bbec7335fad9ae0e063da195808d3d67a82f785fab6f033067d53d4d')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"

    # build lzip.so
    (cd "lua/libs/lzip" && make LUA_IMPL=luajit)

    # build runtime binary
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"

    # install lzip.so
    (cd "lua/libs/lzip" && make DESTDIR="${pkgdir}" install)

    # install executable and license
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install desktop entries
    install -Dm644 "${srcdir}/rusty-path-of-building-1.desktop" "${pkgdir}/usr/share/applications/rusty-path-of-building-1.desktop"
    install -Dm644 "${srcdir}/rusty-path-of-building-2.desktop" "${pkgdir}/usr/share/applications/rusty-path-of-building-2.desktop"

    # install icon
    install -Dm644 "assets/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/rusty-path-of-building.png"
}
