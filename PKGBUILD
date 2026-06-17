# Maintainer: Rafael Epplée <aur@rafa.ee>
# Contributor: Steffen Ridderbusch <steffen@robots.ox.ac.uk>
# Contributor: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=2.1.29
pkgrel=1
pkgdesc='all-in-one encrypted productivity app (unofficial, not supported by upstream)'
arch=('x86_64')
depends=('libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('LicenseRef-proprietary')

_file=Lunatask-${pkgver}.AppImage
source=(https://github.com/lunatask/lunatask/releases/download/v${pkgver}/${_file})
sha512sums=('85ae33ffd3b51727cfd52963b2495e6e29ce51edec4229102e4aac65a0b118dda5d6a9097cd28c17e462e5952146f4a3a9242cde9d237f3b341b83b880fb58b1')

options+=('!strip')

prepare() {
  # Extract AppImage contents so we install bypassing every and all AppImage
  # desktop integration/deployment mechanisms
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &>/dev/null
}

package() {
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/lunatask.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/lunatask.png

  sed -i 's/Exec=AppRun.*/Exec=lunatask/' squashfs-root/lunatask.desktop
  install -Dm644 squashfs-root/lunatask.desktop "$pkgdir"/usr/share/applications/lunatask.desktop

  find squashfs-root -type d -exec chmod 755 {} +
  mkdir -p "$pkgdir"/opt/lunatask
  mv squashfs-root/* "$pkgdir"/opt/lunatask/
  mkdir -p "$pkgdir"/usr/bin
  ln -s /opt/lunatask/lunatask "$pkgdir"/usr/bin/lunatask
}
