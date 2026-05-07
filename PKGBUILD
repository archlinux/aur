# Maintainer:
# Contributor: codepunk <codepunk AT noreply DOT codeberg DOT org>

pkgname=hltb
pkgver=0.4.4
pkgrel=1
pkgdesc="HowLongToBeat CLI tool"
archive=how-long-to-beat-cli
arch=('x86_64')
url="https://codeberg.org/codepunk/${archive}"
license=('AGPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${archive}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

build() {
    cd "${archive}"
    CFLAGS+=" -ffat-lto-objects"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${archive}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${archive}"
    install -Dm0755 -t "${pkgdir}/usr/bin" "target/release/${pkgname}"
}
