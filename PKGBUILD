# Maintainer: Aanok (aanok.aur@gmail.com)
# Contributor: Parker Ellertson (rasputin-machine) <parkerllertson airmail cc>
# Contributor: therealfarfetchd
pkgname='ripcord'
pkgver=0.3.4
pkgrel=1
pkgdesc='Qt-based Discord and Slack client'
arch=('x86_64')
url='https://cancel.fm/ripcord/'
license=('custom')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

_file="Ripcord-${pkgver}-${CARCH}.AppImage"
source=( "https://cancel.fm/dl/$_file" "https://cancel.fm/dl/$_file.asc" )
sha256sums=('1fd8f43a408e1e57ca684162bddbefb8864f29af525b5917a89edd01b763f1f6' 'SKIP')

# !! AppImage is emptied if symbols are stripped away !!
options=('!strip')

PKGEXT='.pkg.tar'

prepare() {
  # we extract so we can install the icon and .desktop files
  chmod +x "$_file"
  "./$_file" --appimage-extract &>/dev/null
}

package() {
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/opt/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  
  install -m644 squashfs-root/Ripcord_Icon.png "$pkgdir"/usr/share/icons/
  
  sed -i 's/Exec=Ripcord/Exec=\/usr\/bin\/ripcord/' squashfs-root/Ripcord.desktop
  install -m644 squashfs-root/Ripcord.desktop "$pkgdir"/usr/share/applications
  
  install "$_file" "$pkgdir"/opt/ripcord
  ln -s /opt/ripcord/"$_file" "$pkgdir"/usr/bin/ripcord
}

