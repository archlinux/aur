# Maintainer:
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=furtherance
pkgver=24.10.3
pkgrel=1
pkgdesc="Track your time without being tracked"
arch=('x86_64')
url="https://github.com/unobserved-io/Furtherance"
license=('GPL-3.0-or-later')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libx11' 'libxss')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('22f1a36adbaedccc5862bf9c21966113920e9db354f304b4b584b4c5d3c1e91e')

prepare() {
    cd "${pkgname^}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS=''
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname^}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS/-flto=auto/}"
    cargo build --frozen --release
}

package() {
    cd "${pkgname^}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 assets/linux/io.unobserved.furtherance.appdata.xml -t "${pkgdir}/usr/share/metainfo"
    install -Dm644 assets/linux/io.unobserved.furtherance.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 assets/icon/io.unobserved.furtherance.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
