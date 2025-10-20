# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.1.2
pkgrel=1
pkgdesc="An offline build planner for Path of Exile using the cross-platform 'rusty-path-of-building' runtime"
url='https://github.com/meehl/rusty-path-of-building'
license=('MIT')
makedepends=('cargo' 'git' 'zlib')
depends=('luajit' 'lua51-curl' 'lua51-luautf8')
arch=('x86_64')
provides=("rusty-path-of-building")
# LTO causes problems with 'ring' (dependency of ureq)
options=('!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meehl/rusty-path-of-building/archive/v${pkgver}.tar.gz"
    "rusty-path-of-building-1.desktop"
    "rusty-path-of-building-2.desktop"
)
b2sums=('78ee61d919eaa6798c1fa18564f5059bcea12698df74a3f1a9abd284517bf64326b9bf5e21e677340a5abc5df59117c09ede8c583503bee5f9d83d75e13b4b2c'
        '1f36d38ebf57060232e9e7dee6b83e1a8897c640d1e298bcf82e2eb14bfff4151415e7ee900517f081f4f22538b6ea4d55115aad736dd190b1836f2b8b397452'
        '00ddcff0984164b162b75b4223c38a67d131c36564a884bf3774ce42490084f38fcd208a9cc24fa9ef7d826c331024b7be0ef10a9fb5069237563a114d6f9239')

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
