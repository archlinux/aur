# Maintainer: Niyoko Yuliawan <niyoko.yuliawan@logisly.com>
pkgname=navicat18-premium-en
pkgver=18.0.1
pkgrel=2
pkgdesc='Navicat Premium trial with complete shutdown when its last window closes'
arch=('x86_64')
url='https://www.navicat.com/en/products/navicat-premium'
license=('LicenseRef-proprietary')
depends=('systemd-libs' 'wmctrl')
provides=('navicat-premium')
conflicts=('navicat-premium')
options=('!strip')
source=(
  "navicat-premium-en-${CARCH}-${pkgver}.AppImage::https://dn.navicat.com/download/navicat18-premium-en-${CARCH}.AppImage"
  'navicat-close-on-exit'
)
sha256sums=('212758d353c5157ce3f625b7fa0a33ef4f492fa621ffef398678f180b340a7ba'
            '39643c5c2d1fe608983c26555717f2b0999f83dd810f6fdf1587b78489dc75e2')

package() {
  local appimage="navicat-premium-en-${CARCH}-${pkgver}.AppImage"
  local approot="${pkgdir}/opt/navicat-premium"

  chmod +x "${appimage}"
  rm -rf squashfs-root
  "./${appimage}" --appimage-extract >/dev/null

  install -d "${approot}"
  cp -a --no-preserve=ownership squashfs-root/. "${approot}"
  rm "${approot}"/usr/lib/libsystemd.so.0*
  sed -i 's|exec -a "$0"|exec -a /usr/bin/navicat-premium|' "${approot}/AppRun"
  sed -i \
    -e 's|^Exec=.*|Exec=navicat-premium|' \
    -e 's|^Icon=.*|Icon=navicat-premium|' \
    -e 's|^Categories=.*|Categories=Development;Database;|' \
    "${approot}/navicat.desktop"

  install -Dm755 navicat-close-on-exit "${pkgdir}/usr/bin/navicat-premium"
  install -Dm644 "${approot}/navicat.desktop" \
    "${pkgdir}/usr/share/applications/navicat18-premium-en.desktop"
  install -Dm644 squashfs-root/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-premium.png"
  install -Dm644 squashfs-root/manual.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"
}
