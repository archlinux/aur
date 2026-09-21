# Maintainer: Niyoko Yuliawan <niyoko.yuliawan@logisly.com>
pkgname=navicat18-mysql-en
pkgver=18.0.1
pkgrel=1
pkgdesc='Navicat for MySQL trial with complete shutdown when its last window closes'
arch=('x86_64')
url='https://www.navicat.com/en/products/navicat-for-mysql'
license=('LicenseRef-proprietary')
depends=('systemd-libs' 'wmctrl')
provides=('navicat-mysql')
conflicts=('navicat-mysql')
options=('!strip')
source=(
  "navicat-mysql-en-${CARCH}-${pkgver}.AppImage::https://dn.navicat.com/download/navicat18-mysql-en-${CARCH}.AppImage"
  'navicat-close-on-exit'
)
sha256sums=('9151931a382596e6f2febf4e26a7e7b54cfae6290069acb84f7f60d4f3ebb5c6'
            '39643c5c2d1fe608983c26555717f2b0999f83dd810f6fdf1587b78489dc75e2')

package() {
  local appimage="navicat-mysql-en-${CARCH}-${pkgver}.AppImage"
  local approot="${pkgdir}/opt/navicat-mysql"

  chmod +x "${appimage}"
  rm -rf squashfs-root
  "./${appimage}" --appimage-extract >/dev/null

  install -d "${approot}"
  cp -a --no-preserve=ownership squashfs-root/. "${approot}"
  rm "${approot}"/usr/lib/libsystemd.so.0*
  sed -i 's|exec -a "$0"|exec -a /usr/bin/navicat-mysql|' "${approot}/AppRun"
  sed -i \
    -e 's|^Exec=.*|Exec=navicat-mysql|' \
    -e 's|^Icon=.*|Icon=navicat-mysql|' \
    -e 's|^Categories=.*|Categories=Development;Database;|' \
    "${approot}/navicat.desktop"

  install -Dm755 navicat-close-on-exit "${pkgdir}/usr/bin/navicat-mysql"
  install -Dm644 "${approot}/navicat.desktop" \
    "${pkgdir}/usr/share/applications/Navicat.MySQL.18.desktop"
  install -Dm644 squashfs-root/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-mysql.png"
  install -Dm644 squashfs-root/manual.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"
}
