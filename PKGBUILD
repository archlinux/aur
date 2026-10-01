pkgname=radiodyplom-bridge-bin
pkgver=0.1.33
pkgrel=3
pkgdesc='Bridge between amateur radio logging software and radiodyplom.pl'
arch=('x86_64')
url='https://github.com/sq8bwm/radiodyplom-bridge'
license=('GPL-3.0-or-later')
depends=('glibc' 'gtk3' 'libxss' 'libxtst' 'nss')
options=('!strip')
source_x86_64=(
  "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/radiodyplom-bridge-${pkgver}-x86_64.AppImage"
  'radiodyplom-bridge.png'
)
sha256sums_x86_64=(
  'e571331a6a1f578e1bcbdf124f99ef209ffed2d49bebafa51cf4287ebc7fd280'
  '199d7c76c68846c3daa9a13de8b6c638c914db6559acb8bd1ac9516b5cbf75a8'
)

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -a squashfs-root/. "${pkgdir}/opt/${pkgname}/"
  find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
  rm -rf "${pkgdir}/opt/${pkgname}/usr/share/icons"
  rm -f "${pkgdir}/opt/${pkgname}/.DirIcon"
  rm -f "${pkgdir}/opt/${pkgname}/radiodyplom-bridge.png"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/radiodyplom-bridge"

  install -Dm644 radiodyplom-bridge.png \
    "${pkgdir}/usr/share/icons/hicolor/128x128/apps/radiodyplom-bridge.png"
  install -dm755 "${pkgdir}/usr/share/applications"
  sed -e 's|^Exec=.*|Exec=/usr/bin/radiodyplom-bridge --no-sandbox %U|' \
      -e 's|^Icon=.*|Icon=radiodyplom-bridge|' \
      -e '/^X-AppImage-/d' \
      squashfs-root/radiodyplom-bridge.desktop \
      > "${pkgdir}/usr/share/applications/radiodyplom-bridge.desktop"
}