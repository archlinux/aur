# Maintainer: 7White <sevenwhite10@gmail.com>

pkgname=netcatty-bin
_pkgname=netcatty
pkgver=1.1.59
pkgrel=1
pkgdesc='AI-Powered SSH Client, SFTP Browser & Terminal Manager'
arch=('x86_64' 'aarch64')
url='https://github.com/binaricat/Netcatty'
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'fuse2')
optdepends=(
    'libnotify: Desktop notification support'
    'xdg-utils: XDG integration for opening URLs'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

source_x86_64=("${_pkgname}-${pkgver}-x86_64.AppImage::https://github.com/binaricat/Netcatty/releases/download/v${pkgver}/Netcatty-${pkgver}-linux-x86_64.AppImage")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.AppImage::https://github.com/binaricat/Netcatty/releases/download/v${pkgver}/Netcatty-${pkgver}-linux-arm64.AppImage")

sha256sums_x86_64=('916537de9f5be91da6dbddeecd950e6bec95d592ab1bfb85bbef526c4a94231d')
sha256sums_aarch64=('1a1c32349562769cd7983a54118577a1a9c44b2f4fbcf0263b7446ccb9f2aab3')

prepare() {
    chmod +x "${_pkgname}-${pkgver}-"*.AppImage
    "./${_pkgname}-${pkgver}-"*.AppImage --appimage-extract 'usr/share/icons/*' 2>/dev/null || true
    "./${_pkgname}-${pkgver}-"*.AppImage --appimage-extract '*.png' 2>/dev/null || true
}

package() {
    install -Dm755 "${_pkgname}-${pkgver}-"*.AppImage \
        "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${_pkgname}" << 'EOF'
#!/bin/bash
exec /opt/netcatty/netcatty.AppImage --no-sandbox "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" << EOF
[Desktop Entry]
Name=Netcatty
Comment=AI-Powered SSH Client, SFTP Browser & Terminal Manager
Exec=/usr/bin/${_pkgname} %U
Icon=${_pkgname}
Type=Application
Terminal=false
Categories=Development;Network;System;TerminalEmulator;
Keywords=SSH;SFTP;Terminal;AI;
StartupNotify=true
StartupWMClass=Netcatty
MimeType=x-scheme-handler/ssh;
EOF

    if [ -d squashfs-root/usr/share/icons ]; then
        cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
        find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 {} +
        find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 {} +
        install -dm755 "${pkgdir}/usr/share/pixmaps"
        find "${pkgdir}/usr/share/icons" -name 'netcatty.png' -exec cp {} "${pkgdir}/usr/share/pixmaps/" \; 2>/dev/null || true
    fi

    if [ -z "$(find "${pkgdir}/usr/share/icons" -name '*.png' 2>/dev/null)" ]; then
        if [ -f squashfs-root/netcatty.png ]; then
            install -Dm644 squashfs-root/netcatty.png \
                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
        fi
    fi
}
