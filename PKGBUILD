# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-sdl
pkgver=1.10.2
pkgrel=1
pkgdesc="An accurate Amstrad emulator - SDL version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('freeware closed source')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-1.10/${pkgname}-${pkgver}-linux-x86_64.AppImage")
sha256sums=('33a0a7e9179f419e44e54bb079625d8b0b633e0a138f1c974d243f9dfbf5d095')

prepare() {
   chmod +x "${pkgname}-${pkgver}.AppImage"
   ./${pkgname}-${pkgver}.AppImage --appimage-extract > /dev/null
}

package() {
   install -dm755 "${pkgdir}/opt"
   cp -R squashfs-root "${pkgdir}/opt/${pkgname}"

   install -dm755 "${pkgdir}/usr/bin"
cat > "$pkgdir/usr/bin/amspirit-lite-sdl" << 'EOF'
#!/bin/sh
exec /opt/amspirit-lite-sdl/AppRun "$@"
EOF
   chmod 755 "$pkgdir/usr/bin/amspirit-lite-sdl"

   install -dm755 "${pkgdir}/usr/share/icons"
   cp -r --no-preserve=mode,ownership "squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
   install -Dm644 "squashfs-root/amspirit-lite-sdl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   sed -i 's/Exec=/Exec=\/usr\/bin\//g' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

   install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
   #install -Dm644 "squashfs-root/..." -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
