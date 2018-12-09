# Maintainer: Aanok (aanok.aur@gmail.com)
# Contributor: Parker Ellertson (rasputin-machine) <parker@rasputinmachine.com>
# Contributor: therealfarfetchd
pkgname='ripcord'
pkgver=0.3.7
pkgrel=2
pkgdesc='Qt-based Discord and Slack client'
arch=('x86_64')
depends=('fuse2')
url='https://cancel.fm/ripcord/'
license=('custom')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

_file="Ripcord-0.3.7-x86_64.AppImage"
source=('https://cancel.fm/dl/Ripcord-0.3.7-x86_64.AppImage' 'https://cancel.fm/dl/Ripcord-0.3.7-x86_64.AppImage.asc')
sha256sums=('02380aefa3a535ec3962b231c58b57cf89d763e3cff573469d6bd5d64f6be804' 'SKIP')

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
  install -d "$pkgdir"/usr/bin/
  install -d "$pkgdir"/usr/lib/ripcord/
  install -d "$pkgdir"/usr/share/applications/
  install -d "$pkgdir"/usr/share/icons/
  
  install -m644 squashfs-root/Ripcord_Icon.png "$pkgdir"/usr/share/icons/
  
  sed -i 's/Exec=Ripcord/Exec=\/usr\/bin\/ripcord/' squashfs-root/Ripcord.desktop
  install -m644 squashfs-root/Ripcord.desktop "$pkgdir"/usr/share/applications
  
  chmod 755 -R squashfs-root/lib squashfs-root/plugins squashfs-root/plugins/*
  mv squashfs-root/* "$pkgdir"/usr/lib/ripcord/
  ln -s /usr/lib/ripcord/Ripcord "$pkgdir"/usr/bin/ripcord

  # cleanup
  rm "$SRCDEST"/"$_file"{'','.asc'}
  rm -rf "$srcdir"
}
