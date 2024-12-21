# Maintainer: wackbyte <wackbyte@protonmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.14.0
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uiua-lang/uiua/archive/${pkgver}.tar.gz")
b2sums=('0f70d7c2f6adf7963b628ab7147bccd3c37e385d39ffc8a3588050da97764ba6831ac0424de753668eb175d563f95b8247ae75cdd4d56beb9ac8d3cc6241ecaa')
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
    cargo build --frozen --release --features 'full system'
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "${pkgname}-${pkgver}"
    cargo test --frozen --features 'full system'
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" license
}
