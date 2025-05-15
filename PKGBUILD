# Maintainer: Rafael Epplée <aur@rafa.ee>
# Maintainer: Steffen Ridderbusch <steffen@robots.ox.ac.uk>
# Contributor: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=2.0.22
pkgrel=0
pkgdesc='all-in-one encrypted to-do list, habit tracker, journaling, life-tracking and notes app (unofficial and *not* supported by upstream developers)'
arch=('x86_64')
depends=('libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('proprietary')

_file=Lunatask-${pkgver}.AppImage
source=(https://github.com/lunatask/lunatask/releases/download/v${pkgver}/${_file})
sha512sums=('8fc5e109281647d7357bbbfbb2e7683cebb03aa17a17b3f8666bfa7821c22b76abb87d5f238523f4efac5e291c943d7910038005960330e854b5436c927933e6')

options+=('!strip')

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

  sed -i 's/Exec=AppRun.*/Exec=lunatask/' squashfs-root/lunatask.desktop
  install -m644 squashfs-root/lunatask.desktop "$pkgdir"/usr/share/applications/

  find squashfs-root -type d -exec chmod 755 {} +
  mv squashfs-root/* "$pkgdir"/usr/local/lunatask/
  ln -s /usr/local/lunatask/lunatask "$pkgdir"/usr/bin/lunatask
}
