# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.2.10
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
b2sums=('f4986cf18d0e16fb3ca3c7fa5a87889b9185984c832ff6e8eea5e07e71225556cb2dc740e1de7680742c76156945d19ef517ac099d4cae3cd2e609057c6b45e5'
        'aee0f8d3e6171cbe4a331af35125948f2a8398ec9d59d899f58133355cae67ac4fd0b87f38b2efe1f8cf23870bbbb2ac534a6992b5ab31189a9ed42a9d637db6'
        'c2af601318bda69c8c7eba72b37cb6c1a63e052ee50c9e62fe257e2e820952ea92475ce25a573970d0ea3d80348dee7b9e9460563d4e4a1e02064e175a1d0968')

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
