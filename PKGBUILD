# Maintainer: Niyoko Yuliawan <niyoko.yuliawan@logisly.com>
pkgname=navicat17-mariadb-en
pkgver=17.3.10
pkgrel=1
pkgdesc='Navicat for MariaDB trial with complete shutdown when its last window closes'
arch=('x86_64')
url='https://www.navicat.com/en/products/navicat-for-mariadb'
license=('LicenseRef-proprietary')
depends=('systemd-libs' 'wmctrl')
provides=('navicat-mariadb')
conflicts=('navicat-mariadb')
options=('!strip')
source=(
  "navicat-mariadb-en-${CARCH}-${pkgver}.AppImage::https://dn.navicat.com/download/navicat17-mariadb-en-${CARCH}.AppImage"
  'navicat-close-on-exit'
)
sha256sums=('49c976c41a61fb5aa1492466f5a39373ecbf8da3684e5cc7a75f162b41dddd2b'
            '39643c5c2d1fe608983c26555717f2b0999f83dd810f6fdf1587b78489dc75e2')

package() {
  local appimage="navicat-mariadb-en-${CARCH}-${pkgver}.AppImage"
  local approot="${pkgdir}/opt/navicat-mariadb"

  chmod +x "${appimage}"
  rm -rf squashfs-root
  "./${appimage}" --appimage-extract >/dev/null

  install -d "${approot}"
  cp -a --no-preserve=ownership squashfs-root/. "${approot}"
  rm "${approot}"/usr/lib/libsystemd.so.0*
  sed -i 's|exec -a "$0"|exec -a /usr/bin/navicat-mariadb|' "${approot}/AppRun"
  sed -i \
    -e 's|^Exec=.*|Exec=navicat-mariadb|' \
    -e 's|^Icon=.*|Icon=navicat-mariadb|' \
    -e 's|^Categories=.*|Categories=Development;Database;|' \
    "${approot}/navicat.desktop"

  install -Dm755 navicat-close-on-exit "${pkgdir}/usr/bin/navicat-mariadb"
  install -Dm644 "${approot}/navicat.desktop" \
    "${pkgdir}/usr/share/applications/Navicat.MariaDB.17.desktop"
  install -Dm644 squashfs-root/navicat-icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-mariadb.png"
  install -Dm644 squashfs-root/manual.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"
}
