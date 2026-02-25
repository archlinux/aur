# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=babyshark
pkgver=0.2.0
pkgrel=1
pkgdesc='Flows-first PCAP TUI with case files and gorgeous UX'
arch=('x86_64' 'aarch64')
url='https://github.com/vignesh07/babyshark'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('wireshark-cli: live packet capture via tshark')
provides=('babyshark')
conflicts=('babyshark-bin')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${pkgver}/rust"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}/rust"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 rust/target/release/babyshark "${pkgdir}/usr/bin/babyshark"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
