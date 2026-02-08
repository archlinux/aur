# Maintainer: Your Name <your.email@example.com>
pkgname=luban-bin
pkgver=0.2.21
pkgrel=2
pkgdesc="Localhost-only AI code editor built as a browser UI served by a local Rust server"
arch=('x86_64')
url="https://github.com/Xuanwo/luban"
license=('unknown')
depends=('fuse2' 'hicolor-icon-theme')
provides=('luban')
conflicts=('luban')
options=('!strip')
source=("Luban_${pkgver}+20260208_linux-x86_64.AppImage::https://github.com/Xuanwo/luban/releases/download/v${pkgver}%2B20260208/Luban_${pkgver}%2B20260208_linux-x86_64.AppImage")
sha256sums=('0a3c8ae98bd61f9926a62469cbd87d789afcd69e42a06884abe5b0b5deff7ee3')
noextract=("Luban_${pkgver}+20260208_linux-x86_64.AppImage")

prepare() {
    chmod +x "Luban_${pkgver}+20260208_linux-x86_64.AppImage"
    "./${pkgname%%-bin}_${pkgver}+20260208_linux-x86_64.AppImage" --appimage-extract 2>/dev/null || \
    "./Luban_${pkgver}+20260208_linux-x86_64.AppImage" --appimage-extract
}

package() {
    # Install the AppImage
    install -Dm755 "Luban_${pkgver}+20260208_linux-x86_64.AppImage" "${pkgdir}/opt/luban/luban.AppImage"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/luban" << 'EOF'
#!/bin/bash
set -euo pipefail

appimage="/opt/luban/luban.AppImage"
wayland_lib=""

# Work around Tauri AppImage EGL issue on some Wayland setups by preloading
# the system Wayland client library when available.
if [[ "${XDG_SESSION_TYPE:-}" == "wayland" || -n "${WAYLAND_DISPLAY:-}" ]]; then
    for candidate in /usr/lib/libwayland-client.so /usr/lib/libwayland-client.so.0; do
        if [[ -r "${candidate}" ]]; then
            wayland_lib="${candidate}"
            break
        fi
    done
fi

if [[ -n "${wayland_lib}" ]]; then
    if [[ -n "${LD_PRELOAD:-}" ]]; then
        exec env LD_PRELOAD="${wayland_lib}:${LD_PRELOAD}" "${appimage}" "$@"
    else
        exec env LD_PRELOAD="${wayland_lib}" "${appimage}" "$@"
    fi
fi

exec "${appimage}" "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/luban"

    # Install desktop file if exists
    if [[ -f squashfs-root/*.desktop ]]; then
        install -Dm644 squashfs-root/*.desktop "${pkgdir}/usr/share/applications/luban.desktop"
        sed -i 's|Exec=.*|Exec=/usr/bin/luban|g' "${pkgdir}/usr/share/applications/luban.desktop"
    else
        # Create desktop file
        install -dm755 "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/luban.desktop" << EOF
[Desktop Entry]
Name=Luban
Comment=AI Code Editor
Exec=/usr/bin/luban
Icon=luban
Type=Application
Categories=Development;IDE;
Terminal=false
EOF
    fi

    # Install icons if exist
    if [[ -d squashfs-root/usr/share/icons ]]; then
        cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    fi
}
