# Maintainer: Razgak

pkgname=ollie-appimage-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="A minimalist desktop client for Ollama (AppImage release)"
arch=('x86_64')
url="https://github.com/MedGm/Ollie"
license=('MIT')
depends=('fuse2' 'hicolor-icon-theme' 'zlib')
options=('!strip')

source=(
  "${pkgname}-${pkgver}.AppImage::https://github.com/MedGm/Ollie/releases/download/v${pkgver}/Ollie_${pkgver}_amd64.AppImage"
  "ollie.png::https://raw.githubusercontent.com/MedGm/Ollie/main/docs/logo.png"
)

sha256sums=('78bd164b153cda916e6b3c6285216405c1b1a873135993872cd9e1d41f26af56'
            '35b48343c7bf119724ffb696cb4f3a3c11834c9c39bb52c54e4bd25f1238f579')

prepare() {
  chmod +x "${pkgname}-${pkgver}.AppImage"
  "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/ollie"

  install -Dm644 "${srcdir}/ollie.png" "${pkgdir}/usr/share/pixmaps/ollie.png"

  if [ -f "${srcdir}/squashfs-root/ollie.desktop" ]; then
    install -Dm644 "${srcdir}/squashfs-root/ollie.desktop" "${pkgdir}/usr/share/applications/ollie.desktop"
    sed -i 's|^Exec=.*|Exec=/usr/bin/ollie %U|' "${pkgdir}/usr/share/applications/ollie.desktop"
    sed -i 's|^Icon=.*|Icon=ollie|' "${pkgdir}/usr/share/applications/ollie.desktop"
  fi

  if [ -f "${srcdir}/squashfs-root/LICENSE" ]; then
    install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
