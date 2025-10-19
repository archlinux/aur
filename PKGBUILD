# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.1.0
pkgrel=2
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
b2sums=(
    c2f247ed0a0527254443faa3b65ce0a1daee7f22117c76538bc0050bb596cdea2c428053ff51618073e7d6d2ae4cd0b06fb663eb5e947a47aa4817309b574eff
    1f36d38ebf57060232e9e7dee6b83e1a8897c640d1e298bcf82e2eb14bfff4151415e7ee900517f081f4f22538b6ea4d55115aad736dd190b1836f2b8b397452
    00ddcff0984164b162b75b4223c38a67d131c36564a884bf3774ce42490084f38fcd208a9cc24fa9ef7d826c331024b7be0ef10a9fb5069237563a114d6f9239
)

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
    install -Dm644 "rusty-path-of-building-1.desktop" "${pkgdir}/usr/share/applications/rusty-path-of-building-1.desktop"
    install -Dm644 "rusty-path-of-building-2.desktop" "${pkgdir}/usr/share/applications/rusty-path-of-building-2.desktop"

    cd "${pkgname}-${pkgver}"
    pob_dir="${pkgdir}/opt/${pkgname}" 

    install -Dm0755 -t "${pob_dir}/lua/" "lua/libs/lzip/lzip.so"
    install -Dm0755 -t "${pob_dir}" "target/release/${pkgname}"
    install -Dm644 "LICENSE" "${pob_dir}/LICENSE"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
