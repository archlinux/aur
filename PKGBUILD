pkgname=dirhamly
pkgver=0.3.5
pkgrel=2
pkgdesc="Tauri-based app for tracking expense and income"
arch=('x86_64')
url="https://github.com/Abdogouhmad/dirhamlyApp"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libappindicator-gtk3' 'hicolor-icon-theme')
# This prevents Arch from mangling the file if we were keeping it as an AppImage
options=(!strip)

source=(
  "$pkgname-$pkgver.AppImage::https://github.com/Abdogouhmad/dirhamlyApp/releases/download/$pkgver/dirhamly_${pkgver}_amd64.AppImage"
  "$pkgname.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
  chmod +x "$pkgname-$pkgver.AppImage"
  # Extract the contents so we can install them natively
  ./"$pkgname-$pkgver.AppImage" --appimage-extract
}

package() {
  # 1. Install the actual binary (found inside the extracted folder)
  install -Dm755 "${srcdir}/squashfs-root/usr/bin/dirhamly" "${pkgdir}/usr/bin/${pkgname}"

  # 2. Install the Desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # 3. Install the icon (automatically extracted from the AppImage)
  install -Dm644 "${srcdir}/squashfs-root/dirhamly.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  
  # 4. Install the internal libraries that Tauri apps need to run
  cp -r "${srcdir}/squashfs-root/usr/lib/"* "${pkgdir}/usr/lib/" 2>/dev/null || true
}
