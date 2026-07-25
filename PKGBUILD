# Maintainer: Jas Singh <singh.jaskir@outlook.com>

pkgname=wayle
pkgver=0.7.0
pkgrel=1
pkgdesc="A configurable desktop shell for Wayland compositors"
arch=('x86_64')
url="https://github.com/wayle-rs/wayle"
license=('MIT')
conflicts=("${pkgname}-bin" "${pkgname}-git")
depends=(
    'gtk4'
    'gtk4-layer-shell'
    'gtksourceview5'
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
sha256sums=('cbb531e25ab5cd067fb3a5696695ad3361afed266a9530beabc2462e028faefd')

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
    install -Dm755 "target/release/${pkgname}-settings" "${pkgdir}/usr/bin/${pkgname}-settings"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/share/wayle/icons"
    cp -r resources/icons/hicolor "${pkgdir}/usr/share/wayle/icons/"

    target/release/wayle completions bash > wayle.bash
    target/release/wayle completions zsh > _wayle
    target/release/wayle completions fish > wayle.fish

    install -Dm644 wayle.bash "${pkgdir}/usr/share/bash-completion/completions/wayle"
    install -Dm644 _wayle "${pkgdir}/usr/share/zsh/site-functions/_wayle"
    install -Dm644 wayle.fish "${pkgdir}/usr/share/fish/vendor_completions.d/wayle.fish"

    install -Dm644 resources/wayle.service "${pkgdir}/usr/lib/systemd/user/wayle.service"
    install -Dm644 resources/com.wayle.settings.desktop \
        "${pkgdir}/usr/share/applications/com.wayle.settings.desktop"
    install -Dm644 resources/wayle-settings.svg \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/wayle-settings.svg"
}
