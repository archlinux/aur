# Maintainer: VConet <v-conet@outlook.com>

pkgname=open-cad-studio-appimage
pkgver=2026.45
pkgrel=1
pkgdesc="A CAD application built with Rust — 2D/3D drawing, DWG/DXF support, and GPU-accelerated rendering (AppImage)"
arch=('x86_64')
url="https://github.com/HakanSeven12/OpenCADStudio"
license=('GPL-3.0-only')
depends=('xdg-desktop-portal-impl' 'fuse2')

provides=('open-cad-studio')
conflicts=('open-cad-studio')

noextract=("OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage")
source=("OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage::https://github.com/HakanSeven12/OpenCADStudio/releases/download/v${pkgver}/OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage")
sha256sums=('85ee7838059eebc1c913bd2fbab42c579983f4281464cbb3b190fc06f4077ec2')

options=('!strip')

prepare() {
  cd "${srcdir}"
  
  chmod +x OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage
  
  ./OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage --appimage-extract usr/share/applications/io.github.HakanSeven12.OpenCadStudio.desktop
  
  ./OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage --appimage-extract usr/share/icons/hicolor/256x256/apps

  sed -i -e "s|Exec=.\+|Exec=env APPIMAGELAUNCHER_DISABLE=1 /opt/appimages/OpenCADStudio.AppImage %F|g" "${srcdir}/squashfs-root/usr/share/applications/io.github.HakanSeven12.OpenCadStudio.desktop"
}

package() {
  install -Dm755 "${srcdir}/OpenCADStudio-v${pkgver}-linux-${CARCH}.AppImage" "${pkgdir}/opt/appimages/OpenCADStudio.AppImage"

  install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/io.github.HakanSeven12.OpenCadStudio.desktop" "${pkgdir}/usr/share/applications/io.github.HakanSeven12.OpenCadStudio.desktop"

  install -Dm644 -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps" "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/io.github.HakanSeven12.OpenCadStudio.png"
}
