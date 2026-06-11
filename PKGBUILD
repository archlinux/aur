# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-qt
pkgver=1.10.2
pkgrel=1
pkgdesc="An accurate Amstrad emulator - Qt version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('freeware closed source')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-1.10/${pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('28413fc37ab355b1555554005d770cf1ffd115673e4d518890032c8b8810591c')

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

   install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
   #install -Dm644 "squashfs-root/..." -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
