# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=geometrize-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A desktop app that geometrizes images into geometric primitives"
arch=('x86_64')
url='https://www.geometrize.co.uk'
license=('GPL')
provides=('geometrize')
makedepends=('gendesk')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.AppImage")
source=("${pkgname%-bin}-${pkgver}.AppImage::https://github.com/Tw1ddle/geometrize/releases/download/v${pkgver}/geometrize_${pkgver}_linux.AppImage")
sha256sums=('b2d586029fb9371e1c96869e15b65fceb5ef96fd99f58242e914552ad288a242')

package() {
  chmod 755 ./${pkgname%-bin}-${pkgver}.AppImage
  ./${pkgname%-bin}-${pkgver}.AppImage --appimage-extract
  install -Dm644 squashfs-root/Geometrize.png "${pkgdir}/usr/share/pixmaps/geometrize.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Geometrize" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Graphics;Application' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/geometrize"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}