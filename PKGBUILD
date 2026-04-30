# Maintainer: Jordan Sluiter <jordan.sluiter@icloud.com>
pkgname=shrimp
pkgver=0.2.8
pkgrel=1
pkgdesc="Self-hosted AI productivity assistant"
arch=('x86_64')
url="https://github.com/TheSingularis/shrimp"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gtk3' 'nss')
conflicts=('shrimp-bin')
options=('!strip')
source=("SHRIMP-${pkgver}.AppImage::https://github.com/TheSingularis/shrimp/releases/download/v${pkgver}/SHRIMP-${pkgver}.AppImage")
sha256sums=('19dbff5ff83ebbaca4770a7d7192a94c8ff0c3bbb5ce2ffc5d09dbb9fd3aa032')

prepare() {
    chmod +x "SHRIMP-${pkgver}.AppImage"
    ./"SHRIMP-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/lib/shrimp"
    cp -a squashfs-root/. "${pkgdir}/usr/lib/shrimp/"
    chmod 755 "${pkgdir}/usr/lib/shrimp"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/shrimp" <<'EOF'
#!/usr/bin/env sh
export APPDIR=/usr/lib/shrimp
exec /usr/lib/shrimp/AppRun "$@"
EOF

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/shrimp.desktop" <<'EOF'
[Desktop Entry]
Name=SHRIMP
Comment=Self-hosted AI productivity assistant
Exec=/usr/bin/shrimp %U
Icon=shrimp
Type=Application
Categories=Utility;Office;
EOF
}
