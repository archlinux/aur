# Maintainer:
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=furtherance
pkgver=25.3.0
pkgrel=1
pkgdesc="Track your time without being tracked"
arch=('x86_64')
url="https://github.com/unobserved-io/Furtherance"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxss' 'openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b99404e03b8c8436283269c7a61eee02a45e1c349519190cc39ef8cfa705ffab')

prepare() {
    cd "${pkgname^}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname^}-${pkgver}"
    CFLAGS+=" -ffat-lto-objects"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname^}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 assets/linux/io.unobserved.furtherance.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon/io.unobserved.furtherance.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
