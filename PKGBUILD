# Maintainer: Niyoko Yuliawan <niyoko.yuliawan@logisly.com>
pkgname=navicat18-premium-lite-en
pkgver=18.0.1
pkgrel=1
pkgdesc='Navicat Premium Lite with complete shutdown when its last window closes'
arch=('x86_64')
url='https://www.navicat.com/en/products/navicat-premium-lite'
license=('LicenseRef-proprietary')
depends=('systemd-libs' 'wmctrl')
provides=('navicat-premium-lite' 'navicat-premium-lite-en')
conflicts=('navicat-premium-lite' 'navicat-premium-lite-en')
options=('!strip')
source=(
  "navicat-premium-lite-en-${CARCH}-${pkgver}.AppImage::https://dn.navicat.com/download/navicat18-premium-lite-en-${CARCH}.AppImage"
  'navicat-close-on-exit'
  'Navicat.Premium.18.desktop'
)
sha256sums=('fe02a6ad8d9a49c3b15caf67be14f14425d529c5a8bef7e6da13313fb46094e6'
            'db65186718d9a1f738e34ab1bdf40a55ad9d532d68be18ccfe44b2bb02d9360e'
            '9581f32c7cf42ed2acf89fd5a69df05fd98b2de4f840724fb988e6158a5557c9')

package() {
  local appimage="navicat-premium-lite-en-${CARCH}-${pkgver}.AppImage"
  local approot="${pkgdir}/opt/navicat-premium-lite"

  chmod +x "${appimage}"
  rm -rf squashfs-root
  "./${appimage}" --appimage-extract >/dev/null

  install -d "${approot}"
  cp -a --no-preserve=ownership squashfs-root/. "${approot}"
  rm "${approot}"/usr/lib/libsystemd.so.0*
  sed -i 's|exec -a "$0"|exec -a /usr/bin/navicat|' "${approot}/AppRun"

  install -Dm755 navicat-close-on-exit "${pkgdir}/usr/bin/navicat"
  install -Dm644 Navicat.Premium.18.desktop \
    "${pkgdir}/usr/share/applications/Navicat.Premium.18.desktop"
  install -Dm644 squashfs-root/icon.png \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/navicat-premium-lite.png"
  install -Dm644 squashfs-root/manual.pdf \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.pdf"
}
