# Maintainer: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=1.5.9
pkgrel=2
pkgdesc='lunatask.app (unofficial and *not* supported by Lunatask developers'
arch=('x86_64')
depends=('gconf' 'libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('proprietary')

_file=Lunatask-${pkgver}.AppImage
source=(https://lunatask.app/download/${_file})
sha512sums=('1a9254200903fbe95eb20c4cb40fd3e685837c8481a1d0138d807464ace6c746a1709e9e6a61b386b63a81dcaafb0dff1780f4d92f50a01819857651f32d3e3f')

options=('!strip')

prepare() {
  # Extract AppImage contents so we install bypassing every and all AppImage
  # desktop integration/deployment mechanisms
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &>/dev/null
}

package() {
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/local/lunatask/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  install -d "$pkgdir"/usr/share/icons/hicolor/512x512/apps

  install -m644 squashfs-root/usr/share/icons/hicolor/512x512/apps/lunatask.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/lunatask.png

  sed -i 's/Exec=AppRun --no-sandbox %U/Exec=lunatask/' squashfs-root/lunatask.desktop
  install -m644 squashfs-root/lunatask.desktop "$pkgdir"/usr/share/applications/

  find squashfs-root -type d -exec chmod 755 {} +
  mv squashfs-root/* "$pkgdir"/usr/local/lunatask/
  ln -s /usr/local/lunatask/lunatask "$pkgdir"/usr/bin/lunatask
}
