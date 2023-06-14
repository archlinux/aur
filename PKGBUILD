# Maintainer: Zes4Null <rjw1248 at hotmail dot com>


pkgname=openvaf
_name=OpenVAF
pkgver=23.5.0
pkgrel=1
pkgdesc='A Next-Generation Verilog-A compiler https://openvaf.semimod.de/'
arch=(x86_64)
url='https://github.com/pascalkuthe/OpenVAF'
license=('GPL3')
depends=('llvm-libs')
makedepends=('clang' 'lld' 'cargo' 'cargo-nextest')
options=('!lto')

source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_name}-v${pkgver}.tar.gz"
    )

sha256sums=(
    'c20b818cd4106af5f21368b4d801be3d81f2632ac3ec718f4003e1b15474c403'
    )

build() {
    cd "${srcdir}/${_name}-${_name}-v${pkgver}"
    export CARGO_TARGET_DIR=target
    export LLVM_LINK_SHARED=1
    cargo build --release
}

check() {
    cd "${srcdir}/${_name}-${_name}-v${pkgver}"
    cargo nextest run
}

package() {
    cd "${srcdir}/${_name}-${_name}-v${pkgver}"
    install -Dm755 "target/release/openvaf" "${pkgdir}/usr/bin/openvaf"
    install -Dm755 "target/release/verilogae" "${pkgdir}/usr/bin/verilogae"
    #install -Dm755 "target/release/xtask" "${pkgdir}/usr/bin/xtask"
    install -Dm644 "target/release/libverilogae.so" "${pkgdir}/usr/lib/${pkgname}/libverilogae.so"
    install -Dm644 "target/release/libverilogae_py.so" "${pkgdir}/usr/lib/${pkgname}/libverilogae_py.so"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
