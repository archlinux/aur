# Maintainer: Andrea Cattaneo <aur@runme.sh>

pkgname=venturi
_pkgname=Venturi
pkgver=0.4.5
pkgrel=1
pkgdesc="Linux-first, performance oriented minimal video editor"
arch=('x86_64' 'aarch64')
url="https://github.com/VenturiVideo/Venturi"
license=('GPL-3.0-or-later')
# winit/wgpu dlopen() the Wayland, X11, xkbcommon and Vulkan libraries at
# runtime, so namcap reports them as "may not be needed": they are needed.
depends=('glibc' 'gcc-libs' 'ffmpeg' 'alsa-lib' 'libxkbcommon' 'libxkbcommon-x11'
         'wayland' 'libx11' 'vulkan-icd-loader' 'hicolor-icon-theme')
makedepends=('cargo' 'clang' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c9dc9368d8a408996d090ca7421a35778a861eaac40fe8d69f9ab9e6dae30ca3')

prepare() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p vv-app --release --frozen
}

# No check(): the test suite needs a headless Vulkan adapter and the ffmpeg
# binary writing to /tmp, and upstream itself pins it to a single thread
# because of intermittent SIGSEGVs. Not suitable for a packaging build.

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm755 target/release/vv-app "${pkgdir}/usr/bin/vv-app"
    install -Dm644 packaging/appimage/venturi.desktop \
        "${pkgdir}/usr/share/applications/venturi.desktop"

    # Icon file names must match the Icon=venturi key of the .desktop file,
    # same renaming as upstream's scripts/install-linux.sh.
    local dir size f
    for dir in media/icons/linux/hicolor/*/apps; do
        size="$(basename "$(dirname "$dir")")"
        for f in "$dir"/venturi-video.*; do
            install -Dm644 "$f" \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/venturi.${f##*.}"
        done
    done

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
