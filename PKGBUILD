# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>

_pkgname=amneziavpn
pkgname=$_pkgname-bin
pkgver=5.0.1.5
pkgrel=1
pkgdesc="Amnezia VPN Client"
arch=('x86_64')
url="https://github.com/amnezia-vpn/amnezia-client"
license=('GPL-3.0-only')
makedepends=('binwalk' 'p7zip')
provides=($_pkgname)
conflicts=($_pkgname{,-git})
options=(!debug)
install=$_pkgname.install
source=($_pkgname-$pkgver.run::$url/releases/download/$pkgver/AmneziaVPN_${pkgver}_linux_x64.run)
sha256sums=('ddb471efbe149232aa98c75534f98d42114b15fdc7976802f8feaeba320bc791')

prepare() {
  # Rip archives from the installer and extract them
  binwalk -qe -y=7zip $_pkgname-$pkgver.run

  # Flatten the file tree
  rm -rf AmneziaVPN && mkdir AmneziaVPN
  for item in extractions/$_pkgname-$pkgver.run.extracted/*/*; do
    [ -e "$item" ] || continue
    mv "$item" AmneziaVPN
  done

  # Cleanup
  rm -rf extractions

  # Fix the desktop file
  sed -i 's#/usr/share/pixmaps/AmneziaVPN.png#AmneziaVPN#g' "$srcdir"/AmneziaVPN/AmneziaVPN.desktop
}

package() {
  mkdir -p "$pkgdir"/{opt/AmneziaVPN,usr/bin}/
  cp -a "$srcdir"/AmneziaVPN/{bin,lib,plugins,qml,translations}/ "$pkgdir"/opt/AmneziaVPN/
  ln -rs "$pkgdir"/opt/AmneziaVPN/bin/AmneziaVPN "$pkgdir"/usr/bin/AmneziaVPN

  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.desktop -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/AmneziaVPN/AmneziaVPN.png     -t "$pkgdir"/usr/share/icons/hicolor/512x512/apps/
}
