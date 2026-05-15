# Maintainer: Joao Costa <arch@joaocosta.dev>
pkgname=orca-bambustudio-appimage
_pkgname=Orca-BambuStudio
pkgver=1.0.0
pkgrel=4
pkgdesc="G-code generator for 3D printers (Bambu, Prusa, Voron, VzBot, RatRig, Creality, etc.)"
arch=('x86_64')
url="https://github.com/FULU-Foundation/OrcaSlicer-bambulab"
license=('AGPL-3.0')
options=('!strip' '!debug')
provides=('orca-bambustudio')
conflicts=('orca-bambustudio' 'orca-bambustudio-git' 'orca-bambustudio-bin')
depends=('libwebp' 'webkit2gtk-4.1')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/FULU-Foundation/OrcaSlicer-bambulab/releases/download/v${pkgver}/OrcaSlicer-BMCU_Linux_AppImage_ubuntu24.04_amd64_${pkgver}.AppImage" "Orca-BambuStudio.desktop" "orca-bambu")
sha256sums=('fb948fc235c12916fddca8eddf44678ca86c936a4b14acc70d75c2bd22067994' '7bda0d428136d58e990dd47b2d2e59d9db86ce479b08d26abc0a7e9eca86ff7a' '5b90719fdc4f5787d7466a1ef73834ec146a76f13f773b72aaf9b9044e38f675')

package() {

  if [ -f "Orca-BambuStudio.desktop" ]; then
    install -Dm644 "Orca-BambuStudio.desktop" "$pkgdir/usr/share/applications/Orca-BambuStudio.desktop"
  else
    msg2 "Fail: Could not automatically find desktop icon file (Orca-BambuStudio.desktop) within the AppImage."
    exit 1
  fi

  chmod +x "orca-bambu"
  install -Dm755 "orca-bambu" "$pkgdir/usr/bin/orca-bambu"

  cd "$srcdir"

  chmod +x "${_pkgname}-${pkgver}.AppImage"
  install -Dm755 "${_pkgname}-${pkgver}.AppImage" "$pkgdir/usr/bin/${_pkgname}"

  ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract &>/dev/null

  if [ -f "squashfs-root/OrcaSlicer.png" ]; then
    install -Dm644 "squashfs-root/OrcaSlicer.png" "$pkgdir/usr/share/pixmaps/OrcaSlicer.png"
  else
    msg2 "Warning: Could not automatically find an icon file (OrcaSlicer.png) within the AppImage."
    msg2 "         Desktop entry icon might be missing."
  fi
}
