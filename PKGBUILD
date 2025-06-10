# Maintainer: Kemel Zaidan <kemelzaidan@gmail.com>
pkgname=logria
_pkgname=Logria
pkgver=0.4.0
pkgrel=1
url="https://github.com/ReagentX/Logria"
makedepends=('rust' 'cargo')
depends=('glibc' 'gcc-libs')
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="A powerful CLI tool that puts log analytics at your fingertips."
license=('GPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d3db976332aa79a45bb00794ff6a03e7900396cef3060a70debb88b6a7d4bffa')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${_pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    # GPL licences are provided in the /usr/share/licenses/spdx:
    # https://wiki.archlinux.org/title/PKGBUILD#license
}
