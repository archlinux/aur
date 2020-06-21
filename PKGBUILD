# Maintainer: Aanok <aanok.aur@gmail.com>
# Contributor: therealfarfetchd
pkgname='ripcord'
pkgver=0.4.26
pkgrel=1
pkgdesc='Qt-based Discord and Slack client'
arch=('x86_64')
depends=('harfbuzz' 'libgl')
url='https://cancel.fm/ripcord/'
license=('custom')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

_file="Ripcord-$pkgver-x86_64.AppImage"
source=("https://cancel.fm/dl/$_file"{,.asc} LICENSE)
sha256sums=('784602ca1d8f86f7e8bb01603bc31682ad8d2c8be6e26fa33a423dec5f103445' 'SKIP' 'd7b2d483acceaebebfa068223efd8fb5e0f5d66f642fa234484ca50974c9fa2c')

# !! AppImage is emptied if symbols are stripped away !!
# But beyond that, the program is deployed with symbols on purpose
options=('!strip')

# AppImage is already compressed, no reason to compress it again
# Kept as reminder
#PKGEXT='.pkg.tar'

prepare() {
  # Extract AppImage contents so we install bypassing every and all AppImage
  # desktop integration/deployment mechanisms
  chmod +x "$_file"
  "./$_file" --appimage-extract &>/dev/null
}

package() {
  # directories
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  
  # icon
  install -m644 squashfs-root/Ripcord_Icon.png "$pkgdir"/usr/share/icons/
  
  # .desktop file
  sed -i 's/Exec=Ripcord/Exec=ripcord/' squashfs-root/Ripcord.desktop
  install -m644 squashfs-root/Ripcord.desktop "$pkgdir"/usr/share/applications

  # license
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "$pkgdir"/usr/lib/ripcord/
  ln -s /usr/lib/ripcord/Ripcord "$pkgdir"/usr/bin/ripcord
}
