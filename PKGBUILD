# Maintainer: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=1.5.7
pkgrel=0
pkgdesc='unofficial third-party Arch package for lunatask.app (*not* supported by Lunatask developers)'
arch=('x86_64')
depends=('gconf' 'libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('custom')

_file=Lunatask-${pkgver}.AppImage
source=(https://lunatask.app/download/${_file})
sha256sums=('5703075c7f2cef90d51c47f2eaf17fc6fd45122377e11fef3e0267a90fe63409')

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
