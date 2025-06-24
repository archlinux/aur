# Maintainer: wackbyte <im@purring.fyi>

pkgname=tarmac
pkgver=0.8.2
pkgrel=1
pkgdesc='Command line tool to manage Roblox assets'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://github.com/Roblox/tarmac'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('03156598b14b2eb6e78884d7d71f19504b77998b4d821c1a66df5fbd33d60b913b7338bd27985d1ddb23fff432dc7e0145ea792e3a1abf7785568082df18e7df')
options=(!lto)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
