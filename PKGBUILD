# Maintainer: wintrx1155 <wintrx1155@proton.me>

pkgname=clara-verse
pkgver=0.3.1.beta
pkgrel=3
pkgdesc="A privacy-first, All in one AI workspace featuring LLMs, ComfyUI, n8n, and more"
arch=('x86_64')
url="https://github.com/claraverse-space/ClaraVerse"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme')
optdepends=(
  'ollama: For local LLM support'
  'docker: For ComfyUI integration'
)
provides=('clara-verse')
conflicts=('clara-verse')
options=('!strip')
_pkgver="0.3.1-beta"
_appimage="Clara-${_pkgver}.AppImage"
source=("${_appimage}::https://github.com/claraverse-space/ClaraVerse/releases/download/v${_pkgver}/${_appimage}"
        "clara-verse.desktop")
sha256sums=('e3912a14fd3c9057b5594760df111373ce760d2c0eab5eed67d9d8029d6f0511'
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
