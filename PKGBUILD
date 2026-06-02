# Maintainer: Armando Zambrano <zambrano@armando.one>
pkgname=aquafin
pkgver=1.0.0
pkgrel=1
pkgdesc="Jellyfin TUI client for the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/Armando-ven/aquafin"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'opus' 'dbus' 'chafa')
makedepends=('cargo' 'pkgconf' 'cmake' 'nasm')
optdepends=('mpv: video playback'
            'pipewire: audio output (alternative to alsa)'
            'kitty: inline image support'
            'ghostty: inline image support'
            'foot: inline image support')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('12ce86f35b19d8b8ab890b4be17a77c3232deb4f80c123801996a31358fde3ab')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config.example.toml "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"
}
