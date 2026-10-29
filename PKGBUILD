# Maintainer: Panda <satodu@github.com>
pkgname=bamboo-end-store
pkgver=2.0.0
pkgrel=1
pkgdesc="Console-first software store for EndeavourOS and Arch (pacman, AUR, Flatpak, AppImage), Rust and Qt"
arch=('x86_64')
url="https://github.com/satodu/bamboo-end-store"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'hicolor-icon-theme')
makedepends=('rust' 'cargo')
optdepends=('paru: AUR support'
            'yay: AUR support'
            'flatpak: Flatpak support'
            'libnotify: desktop notifications'
            'konsole: terminal used for installs'
            'kitty: terminal used for installs'
            'fuse2: run AppImages')
conflicts=('bamboo-end-store-bin')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('33b7b9796d3a5b8007c9ae6a8b4f9364348d0e30f86c564fe3a87d4423b7919f')

prepare() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen -p bamboo-end-store
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 target/release/bamboo-end-store "${pkgdir}/usr/bin/bamboo-end-store"
    install -Dm644 packaging/bamboo-end-store.desktop "${pkgdir}/usr/share/applications/bamboo-end-store.desktop"
    install -Dm644 packaging/bamboo-end-store.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/bamboo-end-store.png"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
