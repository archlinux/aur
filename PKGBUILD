# Maintainer: Laurent Carlier <lcarlier@archlinux.org>

pkgname=amspirit-lite-sdl
pkgver=1.17.1
pkgrel=1
pkgdesc="An accurate Amstrad emulator - SDL version (AppImage)"
arch=('x86_64')
depends=(hicolor-icon-theme)
url="https://amspirit.fr/"
license=('CC-BY-NC-ND-4.0')
options=(!strip !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/AMSpiriT-Emulator/amspirit-releases/releases/download/Lite-${pkgver}/Amspirit-Lite-SDL-${pkgver}-${arch}.AppImage")
sha256sums=('320f2bfd929aaa09b2b8baaaa6e20233457f2d1ab59da02bfab8c168bf779d43')

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
   install -Dm644 "squashfs-root/usr/share/applications/amspirit-lite-sdl.desktop" "${pkgdir}/usr/share/applications/amspirit-lite-sdl.desktop"
}
