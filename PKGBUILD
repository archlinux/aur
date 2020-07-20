# Maintainer: nissen22 <bernhardnorneslotsberg at gmail dot com>
# Package heavily inspired by the ordinary Ripcord AUR package and https://wiki.archlinux.org/index.php/Creating_packages
pkgname='ripcord-arch-libs'
pkgver=0.4.26
pkgrel=1
pkgdesc='Qt-based Discord and Slack client. Modified to run on system libraries for Wayland support.'
arch=('x86_64')
depends=('harfbuzz' 'libgl' 'qt5-base' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-websockets' 'libxss')
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
  rm squashfs-root/lib/*
  ln -s /usr/lib/libsodium.so squashfs-root/lib/libsodium.so.18
  rm -rf squashfs-root/plugins
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  install -d "$pkgdir"/usr/share/licenses/"$pkgname"
  
  # icon
  install -m644 squashfs-root/Ripcord_Icon.png "$pkgdir"/usr/share/icons/
  
  # .desktop file
  sed -i 's/Exec=Ripcord/Exec=env\ QT_QPA_PLATFORM_PLUGIN_PATH=\/usr\/lib\/qt\/plugins\ ripcord/g' squashfs-root/Ripcord.desktop
  install -m644 squashfs-root/Ripcord.desktop "$pkgdir"/usr/share/applications

  # license
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # application
  chmod 755 -R squashfs-root
  mv squashfs-root/* "$pkgdir"/usr/lib/ripcord/
  ln -s /usr/lib/ripcord/Ripcord "$pkgdir"/usr/bin/ripcord
}
