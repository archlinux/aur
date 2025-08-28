# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

pkgname=amneziavpn-bin
pkgver=4.8.10.0
pkgrel=1
pkgdesc="Amnezia VPN Client"
arch=('x86_64')
url="https://github.com/amnezia-vpn/amnezia-client"
license=('GPL-3.0-only')
install=amneziavpn.install
conflicts=(amneziavpn amneziavpn-git)
options=(!debug)
source=(amneziavpn-$pkgver.tar.zip::$url/releases/download/$pkgver/AmneziaVPN_${pkgver}_linux_x64.tar.zip)
sha256sums=('bc133c62a87e5b0ba03a1bda70b5b2474fce4e9e1926852b24773f2605ce408d')

# Signature '\x37\x7A\xBC\xAF\x27\x1C' version '\x00\x04'
_archive_offset=0x1ABF361
_archive_size=0x4AF8F17

prepare() {
  # Extract files from installer (only if exists, in case of using '--noextract').
  if [ -e AmneziaVPN_Linux_Installer.tar ]; then
    # Cleanup files from previous run
    rm -rf AmneziaVPN

    # Extract files
    tar -xvf AmneziaVPN_Linux_Installer.tar
    rm -f AmneziaVPN_Linux_Installer.tar

    # Technically, trimming data after the end of the archive is not necessary, 7zip will simply discard it (with warning).
    tail -c +$((_archive_offset+1)) AmneziaVPN_Linux_Installer.bin | head -c $((_archive_size)) > data.7z
    rm -f AmneziaVPN_Linux_Installer.bin

    #7z x data.7z -o'AmneziaVPN'
    mkdir AmneziaVPN && bsdtar -xf data.7z -C AmneziaVPN
    rm -f data.7z
  fi

  # Clean up useless files containing hashes.
  rm -f "$srcdir"/AmneziaVPN/client/bin/*.sha256

  # Fix desktop file
  sed -i 's#/usr/share/pixmaps/AmneziaVPN.png#AmneziaVPN#g' "$srcdir"/AmneziaVPN/AmneziaVPN.desktop
}

package() {
  for d in client service; do
    for f in $(find "$srcdir"/AmneziaVPN/$d -type f -printf "%P\n"); do
      install -Dm644 "$srcdir"/AmneziaVPN/$d/$f -T "$pkgdir"/opt/AmneziaVPN/$d/$f
    done
  done

  pushd "$pkgdir"/opt/AmneziaVPN/
    chmod +x client/{bin/{AmneziaVPN,ck-client,openvpn,ss-local,tun2socks,update-resolv-conf.sh,wireguard-go,xray},AmneziaVPN.sh}
    chmod +x service/{bin/AmneziaVPN-service,AmneziaVPN-service.sh}
  popd

  mkdir -p "$pkgdir"/usr/bin
  ln -rs "$pkgdir"/opt/AmneziaVPN/client/AmneziaVPN.sh "$pkgdir"/usr/bin/AmneziaVPN

  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.png     -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}
