# Maintainer: Rafael Epplée <aur@rafa.ee>
# Contributor: Steffen Ridderbusch <steffen@robots.ox.ac.uk>
# Contributor: Alastair Cooper <alastair@alastair87.me>
pkgname='lunatask'
pkgver=2.1.26
pkgrel=1
pkgdesc='all-in-one encrypted productivity app (unofficial, not supported by upstream)'
arch=('x86_64')
depends=('libindicator-gtk3' 'libappindicator-gtk3' 'libnotify' 'libxss' 'libxtst' )
url='https://lunatask.app'
license=('LicenseRef-proprietary')

_file=Lunatask-${pkgver}.AppImage
source=(https://github.com/lunatask/lunatask/releases/download/v${pkgver}/${_file})
sha512sums=('b106f6a34117c1ae62476658216892accf0f18eb3263115a796cda46def1e5060676740db01b4312b30a20ecd00998b5ace1a421b6b31eab07c1a6f66ac78e61')

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
