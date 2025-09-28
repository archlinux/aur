# Maintainer: wackbyte <im@purring.fyi>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.17.1
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uiua-lang/uiua/archive/${pkgver}.tar.gz")
b2sums=('82e96632a328e07bc7a14538943ddd92f070fc2b7228dc507bc1d3bfff0d1178194f0112265632400b4b4b011e618380ce33adb6bcd9fde5b1dd9232c0cba6de')
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
    cargo build --frozen --release --features 'full no_self_update system'
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo test --frozen --features 'full no_self_update system'
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license
}
