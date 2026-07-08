# Maintainer: Necromortis <necromortis(a)protonmail.com>
pkgname=vultisig
pkgver=1.0.67
pkgrel=1
pkgdesc="Vultisig Linux Application"
arch=('x86_64')
url="https://github.com/vultisig/vultisig-windows"
license=('Apache-2.0')
depends=('webkit2gtk')
options=(!strip)
source=("$pkgname-v$pkgver.AppImage::https://github.com/vultisig/vultisig-windows/releases/download/v$pkgver/$pkgname-v$pkgver.AppImage")
noextract=("$pkgname-v$pkgver.AppImage")
sha256sums=('ac44229c38f59773ddc835538ad4545c001140378acbbddf6e3d43896529d738')

prepare() {
    chmod +x "$pkgname-v$pkgver.AppImage"
    "./$pkgname-v$pkgver.AppImage" --appimage-extract
}

package() {
    # Install the AppImage
    install -Dm755 "$pkgname-v$pkgver.AppImage" "${pkgdir}/opt/vultisig/vultisig.AppImage"

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/vultisig" << 'EOF'
#!/bin/bash
exec /opt/vultisig/vultisig.AppImage "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/vultisig"

    # Install desktop file if exists
    if [[ -f squashfs-root/*.desktop ]]; then
        install -Dm644 squashfs-root/*.desktop "${pkgdir}/usr/share/applications/vultisig.desktop"
        sed -i 's|Exec=.*|Exec=/usr/bin/vultisig|g' "${pkgdir}/usr/share/applications/vultisig.desktop"
    else
        # Create desktop file
        install -dm755 "${pkgdir}/usr/share/applications"
        cat > "${pkgdir}/usr/share/applications/vultisig.desktop" << EOF
[Desktop Entry]
Name=Vultisig
Comment=Vultisig Linux Application
Exec=/usr/bin/vultisig
Icon=vultisig
Type=Application
Categories=Utility;
Terminal=false
EOF
    fi

    # Install icons if exist
    if [[ -d squashfs-root/usr/share/icons ]]; then
        cp -r squashfs-root/usr/share/icons "${pkgdir}/usr/share/"
    fi
}
