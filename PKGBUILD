# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=parqeye
pkgver=0.1.0
pkgrel=1
pkgdesc='Peek inside Parquet files right from your terminal'
arch=('x86_64' 'aarch64')
url='https://github.com/kaushiksrini/parqeye'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
provides=('parqeye')
conflicts=('parqeye-bin')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2b8bc834d91594a708d2eea47f0e9ed2fe79b79dca1e9cad631d20b563a612c3')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/parqeye "${pkgdir}/usr/bin/parqeye"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
