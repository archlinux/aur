# Maintainer: Ersin Can Karaca <canersinkaraca@gmail.com>
pkgname=lapse-git
pkgver=2.3.0.r1.g0000000
pkgrel=1
pkgdesc="Save the last moments of your game and trim clips (replay recorder, latest source)"
arch=('x86_64')
url="https://github.com/canersin/Lapse"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'alsa-lib' 'libglvnd' 'wayland' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'libxcursor'
         'libxrandr' 'libxi' 'dbus' 'ffmpeg' 'gpu-screen-recorder' 'hicolor-icon-theme')
makedepends=('cargo' 'git' 'pkgconf')
optdepends=('xdg-desktop-portal: file dialogs'
            'zenity: file dialogs without a portal'
            'mpv: hardware-accelerated video preview in the trimmer')
provides=('lapse')
conflicts=('lapse' 'lapse-bin')
options=('!lto')
source=("lapse::git+https://github.com/canersin/Lapse.git")
sha256sums=('SKIP')

pkgver() {
    cd lapse
    local version
    version="$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml | head -1)"
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd lapse
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd lapse
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd lapse
    install -Dm755 target/release/Lapse "${pkgdir}/usr/bin/lapse"
    install -Dm644 assets/lapse.desktop "${pkgdir}/usr/share/applications/lapse.desktop"
    install -Dm644 assets/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/lapse.png"
    install -Dm644 assets/lapse.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/lapse.svg"
    install -Dm644 assets/lapse-symbolic.svg "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/lapse-symbolic.svg"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
