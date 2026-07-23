# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-qt
pkgver=1.13.4
pkgrel=1
pkgdesc="An accurate Amstrad emulator - Qt version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('CC-BY-NC-ND-4.0')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-1.13/Amspirit-Lite-Qt-${pkgver}-x86_64.AppImage")
sha256sums=('40ff458bb6eff1a0138f1f64fb285bef2e09959c098faa929d213356cc3f9132')

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
   install -Dm644 "squashfs-root/fr.amspirit.amspirit-lite-qt.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   sed -i 's/Exec=usr/Exec=\/usr/g' "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
