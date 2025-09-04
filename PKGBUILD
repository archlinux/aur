# Maintainer: Rafael Epplée <aur@rafa.ee>
# Contributor: Steffen Ridderbusch <steffen@robots.ox.ac.uk>
# Contributor: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=2.1.7
pkgrel=1
pkgdesc='all-in-one encrypted productivity app (unofficial, not supported by upstream)'
arch=('x86_64')
depends=('libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('LicenseRef-proprietary')

_file=Lunatask-${pkgver}.AppImage
source=(https://github.com/lunatask/lunatask/releases/download/v${pkgver}/${_file})
sha512sums=('19b44fcdc4c70d118b90f8da9f265f87b01ddfb4791d23e59d7bf2ec7b8087802e7c0a37ca60a7e00f0033c5989e87c6e183461714dc155d6c4ba841d3346201')

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
