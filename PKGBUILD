# Maintainer: Henri Osmankäämi <cg+baqfrynhe at jakorasia dot info>
# based on freecad-appimage pkgbuild by:
# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Evgeniy K. <genues@mail.ru>
# Contributor: Igor Moura <hi@igor.mp>

pkgname=ondsel-es-appimage
pkgver=2024.1.0
pkgrel=4
_gitrev=35694
pkgdesc="A general purpose 3D CAD modeler based on FreeCAD (AppImage version)"
arch=('x86_64' 'aarch64')
url="https://ondsel.com/"
license=('LGPL')
depends=('fuse2')
provides=('ondsel-es')
conflicts=('ondsel-es')
#!debug added to work around https://gitlab.archlinux.org/archlinux/packaging/packages/pacman/-/issues/19
options=('!strip' '!debug')
noextract=("ondsel-es-${pkgver}-x86_64.AppImage"
            "ondsel-es-${pkgver}-aarch64.AppImage")

source=("ondsel-es.sh"
        "ondsel-es-desktop.patch")
source_x86_64=("ondsel-es-${pkgver}-x86_64.AppImage::https://github.com/Ondsel-Development/FreeCAD/releases/download/${pkgver}/Ondsel_ES_${pkgver}.${_gitrev}-Linux-x86_64.AppImage")
source_aarch64=("ondsel-es-${pkgver}-aarch64.AppImage::https://github.com/Ondsel-Development/FreeCAD/releases/download/${pkgver}/Ondsel_ES_${pkgver}.${_gitrev}-Linux-aarch64.AppImage")

sha256sums=('bef63d2f4298c27f755664d124f61c29df34263253ad1f92241f54cbc96ae005'
            '5374bf95dcc9bd3b9ea3087b66937e03d77d8ea3af90522247ac6eeb5a1b9d2c')
sha256sums_x86_64=('50d96d7747c5d8cbd56e600d7046aa80406cadeaf1aa71821d95cc2c6a7a38ac')
sha256sums_aarch64=('9d9f59cf43840d459028911eec0055a2ea6fabbbb9021641f94a014bf0f2f877')


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
