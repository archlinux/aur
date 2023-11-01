# Maintainer: nroi <nroi@mailbox.org>
pkgname=audiowarden
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Skip spotify songs you don't like"
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/nroi/audiowarden"
license=('MIT')
makedepends=(cargo)
depends=()
source=('audiowarden.service'
        "https://github.com/nroi/audiowarden/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('a8789704183f5bb551807fff056935c047ddf6c0a72eeb0047ee0ceb4777f3cb'
            '92b9512f8d80c370c0431065c377533c94d761b9969eb916804685c814e642cd'
)

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
