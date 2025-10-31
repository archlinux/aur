# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.2.6
pkgrel=1
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
b2sums=('6823e639961b5ae71a22230f8f0ce1a90eb916c287f77dbf864ebac72476359b3b2fc8c60f0d24f421cc807f5f57b41423a06a566342ec0032818c462c6f06b3'
        '7d7699827022631eae06dd7a163cb9bf1e7f82aa4f6053492ebca3662a3346e382c2603162975001c76a45b977af184848073bbc1d1f08e3516a71764f86865e'
        '89e0359429a91d5a6de7de9764bb3b18d4b7f02aafc0e6fd872ee7e3b64cfa30c8491476574fe2615184aa2236dd34af3fe5acab41fe50a55bb327c523d56f11')

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
}
