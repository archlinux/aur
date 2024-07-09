# Maintainer: Henri Osmankäämi <cg+baqfrynhe at jakorasia dot info>
# based on freecad-appimage pkgbuild by:
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=ondsel-es-appimage
pkgver=2024.2.2
pkgrel=1
_gitrev=37240
pkgdesc="FreeCAD powered Engineering Suite (AppImage version)"
arch=('x86_64' 'aarch64')
url="https://ondsel.com/"
license=('LGPL')
depends=('fuse2')
provides=('ondsel-es')
conflicts=('ondsel-es')
options=('!strip')
noextract=("ondsel-es-${pkgver}-x86_64.AppImage"
            "ondsel-es-${pkgver}-aarch64.AppImage")

source=("ondsel-es.sh"
        "ondsel-es-desktop.patch")
source_x86_64=("ondsel-es-${pkgver}-x86_64.AppImage::https://github.com/Ondsel-Development/FreeCAD/releases/download/${pkgver}/Ondsel_ES_${pkgver}.${_gitrev}-Linux-x86_64.AppImage")
source_aarch64=("ondsel-es-${pkgver}-aarch64.AppImage::https://github.com/Ondsel-Development/FreeCAD/releases/download/${pkgver}/Ondsel_ES_${pkgver}.${_gitrev}-Linux-aarch64.AppImage")

sha256sums=('bef63d2f4298c27f755664d124f61c29df34263253ad1f92241f54cbc96ae005'
            '3658175d04739ef8617577a549d959aa069e26cb38dd82929f1f9089ad722a20')
sha256sums_x86_64=('52b09fb730d5e0725638ae10c4529950e67f749aae88bbbf7bd5937dda354a1d')
sha256sums_aarch64=('424a106e17815fc77a0a229b302da892aea799caf9890450c54f6f61536bcfad')


prepare() {
  cd "${srcdir}"
  chmod +x ondsel-es-${pkgver}-${CARCH}.AppImage
  ./ondsel-es-${pkgver}-${CARCH}.AppImage --appimage-extract com.ondsel.ES.desktop
  ./ondsel-es-${pkgver}-${CARCH}.AppImage --appimage-extract usr/share/icons
  ./ondsel-es-${pkgver}-${CARCH}.AppImage --appimage-extract usr/share/mime/packages
  patch -Np0 <./ondsel-es-desktop.patch
}

package() {
  install -Dm755 "${srcdir}/ondsel-es-${pkgver}-${CARCH}.AppImage" "${pkgdir}/opt/appimages/ondsel-es.AppImage"
  install -Dm755 "${srcdir}/ondsel-es.sh" "${pkgdir}/usr/bin/ondsel-es"
  install -Dm644 "${srcdir}/squashfs-root/com.ondsel.ES.desktop" "${pkgdir}/usr/share/applications/ondsel-es.desktop"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/Ondsel.svg" "${pkgdir}/usr/share/pixmaps/ondsel-es.svg"
  install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/packages/org.freecad.FreeCAD.xml" "${pkgdir}/usr/share/mime/packages/ondsel-es.xml"
}
