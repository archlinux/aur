# Maintainer: Glucy2 <glucy-2@outlook.com>

pkgname=xmtr
pkgver="0.3.1"
pkgrel="1"
pkgdesc="Concurrent traceroute built on trippy that publishes routes, trace several targets at once and see every hop on a map."
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv7h"
    "armv6h"
    "armv5tel"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "riscv64"
    "ppc64le"
    "ppc64"
    "s390x"
    "sparc64"
    "loongarch64"
)
url="https://github.com/Alice39s/xmtr"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo' 'libcap')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('b8ca6583f1cb2b1835cf95db744459afa974772521bf9e998706bb1b430f443f')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 "${srcdir}/${pkgname}-${pkgver}/target/release/xmtr" "${pkgdir}/usr/bin/xmtr"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm0644 "${srcdir}/${pkgname}-${pkgver}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    setcap cap_net_raw+ep "${pkgdir}/usr/bin/xmtr"
}
