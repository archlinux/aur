# Maintainer: Jas Singh <singh.jaskir@outlook.com>

pkgname=wayle
pkgver=0.1.0
pkgrel=1
pkgdesc="A configurable desktop shell for Wayland compositors"
arch=('x86_64')
url="https://github.com/wayle-rs/wayle"
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'libpulse'
    'fftw'
    'libpipewire'
)
makedepends=(
    'clang'
    'rust'
)
optdepends=(
    'upower: battery module'
    'networkmanager: network module'
    'bluez: bluetooth module'
    'power-profiles-daemon: power profiles module'
    'swww: wallpaper rendering'
    'matugen: Material You color extraction'
    'wallust: color extraction'
    'python-pywal: color extraction'
)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e8744f011e841396456267e600fbc370de82567f4b99d6da04118eb638d132be')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find resources/icons/hicolor -type f -name "*.svg" -exec install -Dm644 {} "${pkgdir}/usr/share/wayle/icons/{}" \;
}
