# Maintainer: blitzkriegfc <blitzkriegfc@proton.me>
pkgname=qbz-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Native Qobuz client for Linux with bit-perfect hi-res audio, DAC passthrough, Last.fm scrobbling, and Chromecast/DLNA casting (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/vicrodh/qbz"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'libappindicator-gtk3' 'libxkbcommon' 'openssl')
makedepends=('nodejs' 'npm' 'rust' 'cargo' 'pkgconf' 'clang' 'git')
optdepends=(
    'alsa-utils: Required for bit-perfect device detection and better ALSA device names'
    'pipewire-alsa: PipeWire audio support'
    'pipewire-pulse: PulseAudio compatibility'
)
provides=('qbz')
conflicts=('qbz' 'qbz-bin')
source=("${pkgname}::git+https://github.com/vicrodh/qbz.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    npm ci
    npm run build
    npx tauri build --no-bundle
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install binary
    install -Dm755 "src-tauri/target/release/qbz-nix" "${pkgdir}/usr/bin/qbz"

    # Install desktop file
    install -Dm644 "packaging/arch/qbz.desktop" "${pkgdir}/usr/share/applications/qbz.desktop"

    # Install icons (freedesktop hicolor structure)
    install -Dm644 "src-tauri/icons/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/qbz.png"
    install -Dm644 "src-tauri/icons/48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/qbz.png"
    install -Dm644 "src-tauri/icons/64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qbz.png"
    install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/qbz.png"
    install -Dm644 "src-tauri/icons/256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/qbz.png"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
