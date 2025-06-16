# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=rewrk
pkgver=0.3.2
pkgrel=1
pkgdesc="A more modern http framework benchmarker supporting HTTP/1 and HTTP/2 benchmarks"
arch=(x86_64)
url="https://github.com/lnx-search/rewrk"
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(cargo git)
options=(!debug !lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lnx-search/rewrk/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('b6635eb7e5211ca9f9d3569431663f99')
sha256sums=('8922f6185161b55b75e0bac6d3cdce3e2558535512c773551eefb9d2e567bfa1')
b2sums=('b2a592cbe34aea02e9c44422489b5a664f17f2c1c3766503a9628f26749275a7b9bcd2b59a819159d7adba142fd67b766ba9dd2b3c95834ae21dc335d6a2993c')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "${pkgname}-${pkgver}"

    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"

    cargo build --frozen --release --all-features --target-dir target
}

check() {
    cd "${pkgname}-${pkgver}"

    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
