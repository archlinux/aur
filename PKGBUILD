# Maintainer: Parker Ellertson (rasputin-machine) <parkerellertson at airmail dot cc>
pkgname='ripcord-test'
pkgver=0.3.1
pkgrel=1
pkgdesc='Latest test version of Ripcord'
arch=('x86_64')
url='https://cancel.fm/ripcord/'
license=('custom')
validpgpkeys=('ABBAD1CB484F53024CF5868B69332F9203F21F5C')

_file="Ripcord-${pkgver}-${CARCH}.AppImage"
source=("https://cancel.fm/dl/$_file"
        "https://cancel.fm/dl/$_file.asc")
sha256sums=("5510196fbc040ee5e95dfd4685ef0ec97990dbea87a0b142edb972ed83115d71" "SKIP")

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

