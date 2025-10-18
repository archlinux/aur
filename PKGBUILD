# Maintainer: meehl

pkgname='rusty-path-of-building'
pkgver=0.1.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/meehl/rusty-path-of-building/archive/v${pkgver}.tar.gz")
b2sums=(c2f247ed0a0527254443faa3b65ce0a1daee7f22117c76538bc0050bb596cdea2c428053ff51618073e7d6d2ae4cd0b06fb663eb5e947a47aa4817309b574eff)

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
    pob_dir="${pkgdir}/opt/${pkgname}" 

    install -Dm0755 -t "${pob_dir}/lua/" "lua/libs/lzip/lzip.so"
    install -Dm0755 -t "${pob_dir}" "target/release/${pkgname}"
    install -Dm644 "LICENSE" "${pob_dir}/LICENSE"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
