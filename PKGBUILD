# Maintainer: Vinay Kumar <vinayydv343@gmail.com>
pkgname=shiorii-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Modern offline-first eBook library manager built with Tauri, React, and Rust (AppImage)"
arch=('x86_64')
url="https://github.com/vinayydv3695/Shiori"
license=('MIT')
depends=(
    'fuse2'
)
provides=(
    'shiorii'
    'shiori'
    'shiori-bin'
    'shiori-rin-bin'
    'shiori-ebook-bin'
)
conflicts=(
    'shiorii'
    'shiorii-git'
    'shiori'
    'shiori-git'
    'shiori-bin'
    'shiori-rin'
    'shiori-rin-bin'
    'shiori-ebook'
    'shiori-ebook-bin'
)
source=("Shiori_${pkgver}_amd64.AppImage::https://github.com/vinayydv3695/Shiori/releases/download/v${pkgver}/Shiori_${pkgver}_amd64.AppImage")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    install -Dm755 "Shiori_${pkgver}_amd64.AppImage" "${pkgdir}/opt/shiori/shiori.AppImage"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/shiori" <<'EOF'
#!/usr/bin/env bash
exec /opt/shiori/shiori.AppImage "$@"
EOF

    APPIMAGE_EXTRACT_AND_RUN=1 ./"Shiori_${pkgver}_amd64.AppImage" --appimage-extract >/dev/null

    if [[ -f squashfs-root/usr/share/icons/hicolor/128x128/apps/shiori.png ]]; then
        install -Dm644 squashfs-root/usr/share/icons/hicolor/128x128/apps/shiori.png \
            "${pkgdir}/usr/share/icons/hicolor/128x128/apps/shiori.png"
    fi

    if [[ -f squashfs-root/usr/share/icons/hicolor/32x32/apps/shiori.png ]]; then
        install -Dm644 squashfs-root/usr/share/icons/hicolor/32x32/apps/shiori.png \
            "${pkgdir}/usr/share/icons/hicolor/32x32/apps/shiori.png"
    fi

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shiori.desktop" <<'EOF'
[Desktop Entry]
Name=Shiori
GenericName=eBook Library Manager
Comment=Organize, read, and manage your eBook collection
Exec=shiori
Icon=shiori
Type=Application
Categories=Office;Viewer;Education;
Keywords=ebook;reader;library;epub;pdf;mobi;
Terminal=false
StartupNotify=true
MimeType=application/epub+zip;application/pdf;application/x-mobipocket-ebook;application/vnd.amazon.ebook;
EOF
}
