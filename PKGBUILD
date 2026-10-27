# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>

pkgname=rewrk
pkgver=0.3.2
pkgrel=2
pkgdesc="A more modern http framework benchmarker supporting HTTP/1 and HTTP/2 benchmarks"
arch=(x86_64)
url="https://github.com/lnx-search/rewrk"
license=('MIT')
depends=(glibc libgcc)
makedepends=(rust git)
options=(!debug !lto)
# Upstream does not ship a Cargo.lock; regenerate it with `cargo generate-lockfile` on bumps.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lnx-search/rewrk/archive/refs/tags/${pkgver}.tar.gz"
        "Cargo.lock")
md5sums=('b6635eb7e5211ca9f9d3569431663f99'
         '813be1f6d852ea4a8f0c00509c9f7ef4')
sha256sums=('8922f6185161b55b75e0bac6d3cdce3e2558535512c773551eefb9d2e567bfa1'
            '1a45680fd68a1cd375040fd1c1770ca8b52e5736a13b824a5fe1ba2c037ae75e')
b2sums=('b2a592cbe34aea02e9c44422489b5a664f17f2c1c3766503a9628f26749275a7b9bcd2b59a819159d7adba142fd67b766ba9dd2b3c95834ae21dc335d6a2993c'
        '526a0e6b332ecfcf68a1277759591d14b5d312e3542cc204c66ff618a01be471dc0f42c18ff47b6f40b2c2932119eef5ba9ad4404a8505d1cc07dd97ab75f9ff')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "${pkgname}-${pkgver}" || exit

    cp "${srcdir}/Cargo.lock" .
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}" || exit

    cargo build --frozen --release --all-features --target-dir target
}

check() {
    cd "${pkgname}-${pkgver}" || exit

    cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}" || exit

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/${pkgname}
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
