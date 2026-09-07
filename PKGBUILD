# Maintainer: wackbyte <im@purring.fyi>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=uiua
pkgver=0.19.1
pkgrel=1
pkgdesc='A stack-based array programming language'
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i686' 'x86_64')
url='https://www.uiua.org/'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'libffi')
makedepends=('cargo' 'clang')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uiua-lang/uiua/archive/refs/tags/${pkgver}.tar.gz"
        'bump.patch')
b2sums=('935f95721ec389e834f20a38be3e5b0f6d34ddc451938534be3574fe4c3909eb0df686f96f54bf19fa133deda765db3750e2c2a09fae2aa6541a19754a81c802'
        '666935089486ec36b46a8a42a98245eee2e2663e739c517f7fef9311e554ef1b31ac5e0f89e0ac96d01599ef488a252ee3ce63afaa1adfab5ee5d87f2eaf3286')
options=(!lto)

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "${pkgname}-${pkgver}"
    patch -Np1 -i "${srcdir}/bump.patch"
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
