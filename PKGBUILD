# Maintainer: Jay Fox <fox@xwx.gg>

pkgname=helium-bin
pkgver=0.7.6.1
pkgrel=1
pkgdesc="Private, fast, and honest web browser based on Chromium"
arch=('x86_64' 'aarch64')
url="https://helium.computer"
license=('GPL-3.0-or-later')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libdrm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'zlib'
)
optdepends=(
    'libva: hardware video acceleration'
    'libpipewire: screen sharing under Wayland'
    'pipewire: screen sharing under Wayland'
    'qt5-base: enable Qt5 integration for KDE'
    'qt6-base: enable Qt6 integration for KDE'
    'xdg-utils: open URLs with desktop default handler'
)
provides=('helium' 'chromium')
conflicts=('helium')
options=('!strip' '!emptydirs')

source_x86_64=("https://github.com/imputnet/helium-linux/releases/download/0.7.6.1/helium-0.7.6.1-x86_64_linux.tar.xz")
source_aarch64=("https://github.com/imputnet/helium-linux/releases/download/0.7.6.1/helium-0.7.6.1-arm64_linux.tar.xz")

sha256sums_x86_64=('44bd0c32c62671ba19b7b6aad91ffaa272d7d5b4f19446e197007bc816fce28b')
sha256sums_aarch64=('b64a941824817141292eb0256c9f40b708d84b0701721c7fa7969c06ba7a5ab9')

# GPG signature verification
validpgpkeys=('7AE370C0BA3BAFA22DF85039C0B7810D56020A38')

package() {
    # Map CARCH to upstream naming convention
    local _arch_name
    case "${CARCH}" in
        x86_64) _arch_name="x86_64" ;;
        aarch64) _arch_name="arm64" ;;
        *) _arch_name="${CARCH}" ;;
    esac
    
    local _extracted_dir="helium-${pkgver}-${_arch_name}_linux"
    
    # Install to /opt/helium
    install -dm755 "${pkgdir}/opt/helium"
    cp -a "${_extracted_dir}"/* "${pkgdir}/opt/helium/"
    
    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/helium" <<'EOF'
#!/bin/bash
export CHROME_WRAPPER=/usr/bin/helium
export CHROME_DESKTOP=helium.desktop
exec /opt/helium/chrome "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/helium"
    
    # Install desktop file
    install -Dm644 "${_extracted_dir}/helium.desktop" \
        "${pkgdir}/usr/share/applications/helium.desktop"
    
    # Fix Exec path in desktop file
    sed -i 's|Exec=chromium|Exec=/usr/bin/helium|g' \
        "${pkgdir}/usr/share/applications/helium.desktop"
    
    # Install icon
    install -Dm644 "${_extracted_dir}/product_logo_256.png" \
        "${pkgdir}/usr/share/pixmaps/helium.png"
    
    # Install icons at various sizes
    for size in 16 24 32 48 64 128 256; do
        install -Dm644 "${_extracted_dir}/product_logo_256.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/helium.png"
    done
    
    # Install license
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'LICEOF'
Helium is licensed under GPL-3.0.
See:  https://github.com/imputnet/helium/blob/main/LICENSE

Components from ungoogled-chromium retain their BSD-3-Clause license.
See: https://github.com/imputnet/helium/blob/main/LICENSE.ungoogled_chromium
LICEOF
}