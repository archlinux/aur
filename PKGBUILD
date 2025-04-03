# Maintainer: wackbyte <im@purring.fyi>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.15.0
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uiua-lang/uiua/archive/${pkgver}.tar.gz")
b2sums=('6379ed5a24f320c13554b9ae2faff72dbbd88de4c809a68b4a4dac08022cc3b3ce1d303e245c97b6029712a11f363cda4d9b837302f6b56998578378cb9d720b')
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
