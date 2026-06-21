# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=orca-bambustudio-appimage
_pkgname=BambuStudio-OrcaSlicer
pkgver=02.07.01.57
pkgrel=1
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.) with changes from Pawel Jarczak for Bambu Cloud Support"
arch=('x86_64')
url="https://github.com/jarczakpawel/OrcaStudio"
license=('AGPL-3.0-only')
options=('!strip' '!debug')
provides=('orca-bambustudio')
conflicts=('orca-bambustudio' 'orca-bambustudio-git' 'orca-bambustudio-bin')
depends=('libwebp' 'webkit2gtk-4.1')
source=("${_pkgname}-${pkgver//_/-}.AppImage::https://github.com/jarczakpawel/OrcaStudio/releases/download/v${pkgver//_/-}/${_pkgname}_Linux_AppImage_ubuntu24.04_amd64_${pkgver//_/-}.AppImage")
sha256sums=('d516b3865c85109fbdd92394b43c6e0b18c44f7a3b1d09d3ff35bd9495f5867e')

package() {

  #if [ -f "Orca-BambuStudio.desktop" ]; then
  #  install -Dm644 "Orca-BambuStudio.desktop" "$pkgdir/usr/share/applications/Orca-BambuStudio.desktop"
  #else
  #  msg2 "Fail: Could not automatically find desktop icon file (Orca-BambuStudio.desktop) within the AppImage."
  #  exit 1
  #fi

  #chmod +x "orca-bambu"
  #install -Dm755 "orca-bambu" "$pkgdir/usr/bin/orca-bambu"

  cd "$srcdir"
  chmod +x "${_pkgname}-${pkgver//_/-}.AppImage"
  ./"${_pkgname}-${pkgver//_/-}.AppImage" --appimage-extract 
  if [ -f "squashfs-root/com.orcaslicer.BambuStudio-OrcaSlicer.desktop" ]; then
    sed 's|Exec=AppRun %F|Exec=/usr/bin/bambustudio-orcaslicer|' squashfs-root/com.orcaslicer.BambuStudio-OrcaSlicer.desktop > com.orcaslicer.BambuStudio-OrcaSlicer.desktop
    install -Dm644 "com.orcaslicer.BambuStudio-OrcaSlicer.desktop" "$pkgdir/usr/share/applications/com.orcaslicer.BambuStudio-OrcaSlicer.desktop"
  else
    echo "Fail: Could not automatically find Desktop entry file (com.orcaslicer.BambuStudio-OrcaSlicer.desktop) within the AppImage."
    exit 1
  fi

  if [ -f "squashfs-root/BambuStudio-OrcaSlicer.png" ]; then
    install -Dm644 "squashfs-root/BambuStudio-OrcaSlicer.png" "$pkgdir/usr/share/pixmaps/BambuStudio-OrcaSlicer.png"
  else
    echo "Warning: Could not automatically find an icon file (OrcaSlicer.png) within the AppImage."
    echo "         Desktop entry icon might be missing."
  fi

  chmod +x "${_pkgname}-${pkgver//_/-}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver//_/-}.AppImage" "$pkgdir/usr/bin/${_pkgname,,}"
  
}
