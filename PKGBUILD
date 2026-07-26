# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=orca-bambustudio-appimage
_pkgname=OrcaStudio
pkgver=02.08.01.55
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
sha256sums=('ffb2756c0bc46fd84f3afa68ef78bee35e5d1aa30f6313a20671dd9b610a6e36')

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
  if [ -f "squashfs-root/com.orcaslicer.${_pkgname}.desktop" ]; then
	  sed "s|Exec=AppRun %F|Exec=/usr/bin/${_pkgname,,}|" squashfs-root/com.orcaslicer.${_pkgname}.desktop > com.orcaslicer.${_pkgname}.desktop
    install -Dm644 "com.orcaslicer.${_pkgname}.desktop" "$pkgdir/usr/share/applications/com.orcaslicer.${_pkgname}.desktop"
  else
    echo "Fail: Could not automatically find Desktop entry file (com.orcaslicer.${_pkgname}.desktop) within the AppImage."
    exit 1
  fi

  if [ -f "squashfs-root/${_pkgname}.png" ]; then
    install -Dm644 "squashfs-root/${_pkgname}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
  else
    echo "Warning: Could not automatically find an icon file (${_pkgname}.png) within the AppImage."
    echo "         Desktop entry icon might be missing."
  fi

  chmod +x "${_pkgname}-${pkgver//_/-}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver//_/-}.AppImage" "$pkgdir/usr/bin/${_pkgname,,}"
  
}
