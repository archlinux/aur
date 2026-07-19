# Maintainer: Ryannnkl <ryannnkl@gmail.com>

pkgname=lumalock
pkgver=0.2.0
pkgrel=1
pkgdesc="Secure and customizable Wayland session locker"
arch=('x86_64')
url="https://github.com/Ryannnkl/luma"
license=('MIT')
depends=('libxkbcommon' 'pam')
makedepends=('cargo' 'pkgconf')
backup=('etc/pam.d/luma')
source=("luma-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bbd6cf09499f02081abcb71678ce68e02c644cf862b6e1aacf80bf0c1f988865')

prepare() {
    cd "luma-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "luma-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --frozen
}

check() {
    cd "luma-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "luma-${pkgver}"

    install -Dm755 target/release/luma "${pkgdir}/usr/bin/luma"
    install -Dm644 pam/luma "${pkgdir}/etc/pam.d/luma"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config.example.toml \
        "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"
}
