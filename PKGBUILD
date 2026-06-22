pkgname=liber-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('gtk3' 'nss' 'alsa-lib')
provides=('liber')
conflicts=('liber')
options=('!strip')
source=("liber-${pkgver}-x86_64.AppImage::https://github.com/nickheyer/liber-desktop/releases/download/v${pkgver}/liber-${pkgver}-x86_64.AppImage")
sha256sums=('c00ec4fdecd6ec9ff16bd877263256c90170857f65a7e1535c3995ae2bf59bb8')

package() {
  chmod +x "liber-${pkgver}-x86_64.AppImage"
  "./liber-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}"
  chmod -R u=rwX,go=rX "${pkgdir}/opt/${pkgname}"
  chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/liber" "${pkgdir}/usr/bin/liber"
  install -Dm644 squashfs-root/liber.desktop "${pkgdir}/usr/share/applications/sh.liber.Liber.desktop"
  for px in 16 24 32 48 64 128 256 512; do
    icon="squashfs-root/usr/share/icons/hicolor/${px}x${px}/apps/liber.png"
    [ -f "${icon}" ] && install -Dm644 "${icon}" "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/liber.png"
  done
}
