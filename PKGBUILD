# Maintainer: sunkhan
pkgname=decibell
pkgver=0.5.7
pkgrel=1
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
    'gtk3'
    'dbus'
    'pipewire'
    'libpipewire'
    'gst-plugins-base-libs'
    'ffmpeg'
    'opus'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'protobuf'
    'pkgconf'
    'clang'
)
provides=('decibell')
conflicts=('decibell-bin' 'decibell-git')
options=('!strip' '!lto')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/sunkhan/decibell/archive/refs/tags/v${pkgver}.tar.gz"
    "decibell.desktop"
)
sha256sums=('SKIP' 'SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/tauri-client"

    # Install frontend deps
    npm ci

    # Build via the Tauri CLI so the binary is compiled in production mode
    # (uses frontendDist, not devUrl) and links against system libs.
    npm run tauri build -- --no-bundle
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/tauri-client"

    # Binary — installed to libexec and wrapped so we can pin env vars
    install -Dm755 "src-tauri/target/release/decibell" \
        "${pkgdir}/usr/lib/decibell/decibell"

    # Launcher wrapper
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/decibell" <<'LAUNCHER'
#!/bin/sh
# WebKitGTK's DMABuf renderer fails to allocate GBM buffers on many
# Mesa/NVIDIA setups ("Failed to create GBM buffer ... Invalid argument"),
# resulting in a blank window. Fall back to the classic renderer.
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /usr/lib/decibell/decibell "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/decibell"

    # Desktop entry
    install -Dm644 "${srcdir}/decibell.desktop" \
        "${pkgdir}/usr/share/applications/decibell.desktop"

    # Icons — Tauri keeps sized PNGs in src-tauri/icons/
    for size in 32 64 128 256; do
        src=""
        case "$size" in
            32)  src="src-tauri/icons/32x32.png" ;;
            64)  src="src-tauri/icons/64x64.png" ;;
            128) src="src-tauri/icons/128x128.png" ;;
            256) src="src-tauri/icons/128x128@2x.png" ;;
        esac
        if [ -f "$src" ]; then
            install -Dm644 "$src" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/decibell.png"
        fi
    done
}
