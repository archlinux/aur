# Maintainer: Rami Chowdhury <necaris@gmail.com>
# Maintainer: Tobias Backer Dirks <omgitsaheadcrab@gmail.com>
# Co-Maintainer: LSM <sagargaud88@gmail.com>
pkgname=popsql
pkgver=1.0.135
pkgrel=1
pkgdesc="Collaborative SQL editor for teams"
arch=('x86_64')
url="https://popsql.com"
license=('custom:proprietary')
depends=('fuse2' 'gtk3' 'nss' 'libxss' 'libnotify' 'alsa-lib')
provides=('popsql')
conflicts=('popsql')
source=("PopSQL-${pkgver}.AppImage::https://get.popsql.com/download/AppImage")
sha256sums=('1dec3c2cbea7365a80967f50970321b5e2de8cf039ddc9c0d9f92f4dfcab1746')
options=('!strip')

prepare() {
    chmod +x "PopSQL-${pkgver}.AppImage"
    ./PopSQL-${pkgver}.AppImage --appimage-extract >/dev/null 2>&1
}

package() {
    # Install AppImage
    install -Dm755 "${srcdir}/PopSQL-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/PopSQL.AppImage"
    
    # Wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/bash
exec /opt/popsql/PopSQL.AppImage "$@"
EOF

    # Install desktop file
    if [[ -f "${srcdir}/squashfs-root/@popsqldesktop.desktop" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/@popsqldesktop.desktop" \
            "${pkgdir}/usr/share/applications/popsql.desktop"
        
        sed -i 's|Exec=AppRun.*|Exec=/usr/bin/popsql %U|g' \
            "${pkgdir}/usr/share/applications/popsql.desktop"
        sed -i 's|Icon=.*|Icon=popsql|g' \
            "${pkgdir}/usr/share/applications/popsql.desktop"
    fi

    # FIXED: Correct icon installation with proper path parsing
    if [[ -d "${srcdir}/squashfs-root/usr/share/icons/hicolor" ]]; then
        find "${srcdir}/squashfs-root/usr/share/icons/hicolor" -name "@popsqldesktop.png" | while read icon; do
            # Get the full path relative to hicolor directory
            relative_path="${icon#${srcdir}/squashfs-root/usr/share/icons/hicolor/}"
            
            # Replace the @popsqldesktop filename with popsql.png
            target_path="${relative_path//@popsqldesktop.png/popsql.png}"
            
            # Install to correct location
            install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/${target_path}"
        done
    fi

    # Install licenses
    if [[ -f "${srcdir}/squashfs-root/LICENSE.electron.txt" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/LICENSE.electron.txt" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    fi
    
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
PopSQL - Proprietary Software
Copyright © PopSQL, Inc. All rights reserved.
This software is proprietary and subject to the terms at: https://popsql.com/terms
EOF
}
