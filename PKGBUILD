# Maintainer: Connor McFarlane <cm at semtex dot net>

pkgname=flexoptix
pkgver=5.21.0
pkgrel=1
pkgdesc='Flexoptix Flexbox transceiver programmer'
arch=('any')
url='https://www.flexoptix.net/en/flexoptix-app'
license=('custom')
depends=('hidapi')
makedepends=('asar')
install=flexoptix.install
source=("flexoptix-${pkgver}.AppImage::https://flexbox.reconfigure.me/download/electron/linux/x64/FLEXOPTIX%20App.${pkgver}-latest.AppImage"
        'https://www.flexoptix.net/skin/udev_rules/99-tprogrammer.rules'
        'disable-autoupdate.patch')
sha256sums=('6910cae629c02faaf34b6ee7ccffa69ee59cc2f66432a79dfff230fa9acab7ab'
            '3997b9755e74c6af7da252266e8ec94313e345dee11b204857016fb51f5c2157'
            'f1ae709af8a4c26d177d9339084b7dc73fd9bbb988f4e7601e0969f5f0121612')

prepare() {
  _appdir="${srcdir}/squashfs-root"
  
  # extract appimage
  chmod +x "${srcdir}/flexoptix-${pkgver}.AppImage"
  "${srcdir}/flexoptix-${pkgver}.AppImage" --appimage-extract >/dev/null

  # use system libs
  rm -rf "${_appdir}/usr/lib"

  # upstream updates cause the update checker to fail so
  # we need to patch it out

  asar extract "${_appdir}/resources/app.asar" app-asar
  patch --forward -p0 --input="${srcdir}/disable-autoupdate.patch"
  asar pack app-asar "${_appdir}/resources/app.asar"
}

package() {
  _appdir="${srcdir}/squashfs-root"
  
  install -d "${pkgdir}/opt/flexoptix"
  install -d "${pkgdir}/usr/local/bin"
  
  # install desktop entries
  install -Dm644 "${_appdir}/flexoptix-app.desktop" "${pkgdir}/usr/share/applications/flexoptix-app.desktop"
  install -Dm644 "${_appdir}/flexoptix-app.png" "${pkgdir}/usr/share/applications/flexoptix-app.png"
  install -Dm644 "${_appdir}/usr/share/icons/hicolor/0x0/apps/flexoptix-app.png" "${pkgdir}/usr/share/icons/hicolor/0x0/apps/flexoptix-app.png"

  # clean up unused bits
  rm -rf "${_appdir}/usr" "${_appdir}/flexoptix-app.desktop" "{_appdir}/flexoptix-app.png"

  # copy application
  cp -rT "${_appdir}" "${pkgdir}/opt/flexoptix"
  chmod -R 755 "${pkgdir}/opt/flexoptix"

  # install USB udev rules
  install -D "${srcdir}/99-tprogrammer.rules" "${pkgdir}/etc/udev/rules.d/99-flexoptix.rules"

  ln -s "/opt/flexoptix/flexoptix-app" "${pkgdir}/usr/local/bin/flexoptix"
}

