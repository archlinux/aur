# Maintainer: Chiwan Park <chiwanpark@hotmail.com>
pkgname='mendeley-reference-manager'
pkgver=2.110.2
pkgrel=1
pkgdesc='Mendeley Reference Manager'
arch=('x86_64')
depends=('harfbuzz' 'libgl' 'libxss')
url='https://www.mendeley.com/download-reference-manager'
license=('custom')

_file=mendeley-reference-manager-${pkgver}-x86_64.AppImage
source=(https://static.mendeley.com/bin/desktop/${_file})
sha256sums=('00934d08f1302c03b5f99b9be98c9a77965cb25df9cdfe1d11ba32184f70497f')

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
