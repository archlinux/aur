# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=orca-bambustudio-appimage
_pkgname=Orca-BambuStudio
pkgver=1.0.0
pkgrel=1
pkgdesc="PC Software for BambuLab and other 3D printers"
arch=('x86_64')
url="https://github.com/FULU-Foundation/OrcaSlicer-bambulab"
license=('AGPL-3.0')
options=('!strip' '!debug')
provides=('orca-bambustudio')
conflicts=('orca-bambustudio' 'orca-bambustudio-git' 'orca-bambustudio-bin')
depends=('webkit2gtk-4.1')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/FULU-Foundation/OrcaSlicer-bambulab/releases/download/v${pkgver}/OrcaSlicer-BMCU_Linux_AppImage_ubuntu24.04_amd64_${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  if [ -f "../Orca-BambuStudio.desktop" ]; then
    install -Dm644 "../Orca-BambuStudio.desktop" "$pkgdir/usr/share/applications/Orca-BambuStudio.desktop"
  else
    msg2 "Fail: Could not automatically find desktop icon file (Orca-BambuStudio.desktop) within the AppImage."
    exit 1
  fi

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/${_pkgname}-${pkgver}"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  if [ -f "squashfs-root/OrcaSlicer.png" ]; then
    install -Dm644 "squashfs-root/OrcaSlicer.png" "$pkgdir/usr/share/pixmaps/OrcaSlicer.png"
  else
    msg2 "Warning: Could not automatically find an icon file (OrcaSlicer.png) within the AppImage."
    msg2 "         Desktop entry icon might be missing."
  fi
}
