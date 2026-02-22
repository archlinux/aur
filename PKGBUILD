# Maintainer: Skyler <sm+aur@skym.fi>
pkgname=discrakt
pkgver=3.4.2
pkgrel=1
pkgdesc="The Trakt/Plex Discord Rich Presence that you didn't know you needed"
arch=('x86_64' 'aarch64')
url="https://github.com/afonsojramos/discrakt"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo')
optdepends=('discord: Required to display Rich Presence')
conflicts=('discrakt-bin' 'discrakt-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/afonsojramos/discrakt/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('fd53f53990a75086befb4704f43436077a8bf72f71bec05f9aeadea1d221833d')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install the binary
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install README
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
