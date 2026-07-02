# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-sdl
pkgver=1.12.7
pkgrel=1
pkgdesc="An accurate Amstrad emulator - SDL version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('CC-BY-NC-ND-4.0')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-${pkgver}/Amspirit-Lite-SDL-${pkgver}-x86_64.AppImage")
sha256sums=('d27b1f3724021b7db28f21924ae5d07a13a96d6ec3fb373d0762b52f7c6bd2dd')

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
}
