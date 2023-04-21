# Maintainer: Chiwan Park <chiwanpark@hotmail.com>
pkgname='mendeley-reference-manager'
pkgver=2.88.0
pkgrel=1
pkgdesc='Mendeley Reference Manager'
arch=('x86_64')
depends=('harfbuzz' 'libgl' 'libxss')
url='https://www.mendeley.com/download-reference-manager'
license=('custom')

_file=mendeley-reference-manager-${pkgver}-x86_64.AppImage
source=(https://static.mendeley.com/bin/desktop/${_file})
sha256sums=('00f124daf375736ddcdbf99eca1e043b6959d2af01225a61bcd0fc9064732a2d')

options=('!strip')

prepare() {
  # Extract AppImage contents so we install bypassing every and all AppImage
  # desktop integration/deployment mechanisms
  chmod +x "${_file}"
  "./${_file}" --appimage-extract &>/dev/null
}

package() {
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/local/mendeley-reference-manager/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/

  install -m644 squashfs-root/mendeley-reference-manager.png "$pkgdir"/usr/share/icons/

  sed -i 's%Exec=AppRun%Exec=/usr/bin/mendeley-reference-manager%g' squashfs-root/mendeley-reference-manager.desktop
  install -m644 squashfs-root/mendeley-reference-manager.desktop "$pkgdir"/usr/share/applications/

  find squashfs-root -type d -exec chmod 755 {} +
  mv squashfs-root/* "$pkgdir"/usr/local/mendeley-reference-manager/
  ln -s /usr/local/mendeley-reference-manager/mendeley-reference-manager "$pkgdir"/usr/bin/mendeley-reference-manager
}
