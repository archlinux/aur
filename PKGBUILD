# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-qt
pkgver=1.14.3
pkgrel=3
pkgdesc="An accurate Amstrad emulator - Qt version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('CC-BY-NC-ND-4.0')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-1.14.3/Amspirit-Lite-Qt-${pkgver}-${arch}.AppImage")
sha256sums=('a165fcd6e17993e83dda177584c9b3fc5ea0166f40596e2fc279850a60250251')

prepare() {
   chmod +x "${pkgname}-${pkgver}.AppImage"
   ./${pkgname}-${pkgver}.AppImage --appimage-extract > /dev/null
}

package() {
   install -dm755 "${pkgdir}/opt"
   cp -R squashfs-root "${pkgdir}/opt/${pkgname}"

   install -dm755 "${pkgdir}/usr/bin"
cat > "$pkgdir/usr/bin/amspirit-lite-qt" << 'EOF'
#!/bin/sh
exec /opt/amspirit-lite-qt/AppRun "$@"
EOF
   chmod 755 "$pkgdir/usr/bin/amspirit-lite-qt"

   install -dm755 "${pkgdir}/usr/share/icons"
   cp -r --no-preserve=mode,ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
   install -Dm644 "squashfs-root/usr/share/applications/amspirit-lite-qt.desktop" "${pkgdir}/usr/share/applications/amspirit-lite-qt.desktop"
}
