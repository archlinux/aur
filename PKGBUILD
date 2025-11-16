# Maintainer: wintrx1155 <wintrx1155@proton.me>

pkgname=clara-verse
pkgver=0.2.0
pkgrel=2
pkgdesc="A privacy-first, All in one AI workspace featuring LLMs, ComfyUI, n8n, and more"
arch=('x86_64')
url="https://github.com/badboysm890/ClaraVerse"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
optdepends=(
  'ollama: For local LLM support'
  'docker: For ComfyUI integration'
)
provides=('clara-verse')
conflicts=('clara-verse')
options=('!strip')
_appimage="Clara-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/badboysm890/ClaraVerse/releases/download/v${pkgver}/${_appimage}"
        "clara-verse.desktop")
sha256sums=('08ed409aee5283020fc4b6f28f6a6e7b6b1386ba3539c26808977f0ce79de202'
            '61d260b4f6d79bf09311cd026ef4cdcba0c49b3857bc5bbeed30885d00423ad3')

package() {
  # Make appimage executable and extract it
  chmod +x "${srcdir}/${_appimage}"
  "${srcdir}/${_appimage}" --appimage-extract > /dev/null 2>&1 || true
  
  # Install the appimage
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/usr/bin/clara-verse"
  
  # Install desktop entry
  install -Dm644 "${srcdir}/clara-verse.desktop" "${pkgdir}/usr/share/applications/clara-verse.desktop"
  
  # Extract and install icons from squashfs-root
  if [ -d "${srcdir}/squashfs-root/usr/share/icons/hicolor" ]; then
    for size_dir in "${srcdir}/squashfs-root/usr/share/icons/hicolor/"*x*; do
      size=$(basename "$size_dir")
      if [ -f "$size_dir/apps/clara-verse.png" ]; then
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/$size/apps"
        install -Dm644 "$size_dir/apps/clara-verse.png" "${pkgdir}/usr/share/icons/hicolor/$size/apps/clara-verse.png"
      fi
    done
  fi
  
  # Clean up extracted squashfs
  rm -rf "${srcdir}/squashfs-root"
}
