# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
pkgname=amneziavpn-bin
pkgver=4.8.7.2
pkgrel=1
pkgdesc="Amnezia VPN Client"
arch=('x86_64')
url="https://github.com/amnezia-vpn/amnezia-client"
license=('GPL-3.0-only')
install=amneziavpn.install
#depends=('')
makedepends=(p7zip)
options=(!debug)
source=("AmneziaVPN.tar.zip::$url/releases/download/$pkgver/AmneziaVPN_${pkgver}_linux_x64.tar.zip")
sha256sums=('ce8261783b7760d3c51d085fe275ae7cb173fb4251a015f268387a9aeca77f6b')

# Signature '\x37\x7A\xBC\xAF\x27\x1C' version '\x00\x04'
_archive_offset=0x1ABF35C
_archive_size=0x4AA6FCB

prepare() {  
  # Cleanup files from previous run
  rm -rf "AmneziaVPN"
  
  # Extract files
  tar -xvf "AmneziaVPN_Linux_Installer.tar"
  rm -f "AmneziaVPN_Linux_Installer.tar"

  # Technically, trimming data after the end of the archive is not necessary, 7zip will simply discard it (with warning).
  tail -c +$((_archive_offset+1)) "AmneziaVPN_Linux_Installer.bin" | head -c $((_archive_size)) > "data.7z"
  rm -f "AmneziaVPN_Linux_Installer.bin"

  7z x "data.7z" -o"AmneziaVPN"
  rm -f "data.7z"
  
  # Fix desktop file
  sed -i 's/4.8.7.2/1.0/g' "$srcdir"/AmneziaVPN/AmneziaVPN.desktop
  sed -i 's#/usr/share/pixmaps/AmneziaVPN.png#AmneziaVPN#g' "$srcdir"/AmneziaVPN/AmneziaVPN.desktop
}

package() {
  mkdir -p "$pkgdir"/{opt/AmneziaVPN,usr/bin}
  cp -a "$srcdir"/AmneziaVPN/{client,service} "$pkgdir"/opt/AmneziaVPN/
  ln -rs "$pkgdir"/opt/AmneziaVPN/client/AmneziaVPN.sh "$pkgdir"/usr/bin/AmneziaVPN
  
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.png     -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}
