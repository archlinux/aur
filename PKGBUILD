# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.11.11
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, beta version.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(gksu mono openvpn)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
provides=('airvpn')
conflicts=('airvpn' 'airvpn-bin')
install=airvpn.install
source_i686=("airvpn_linux_x86_debian_${pkgver}_experimental.deb"::'https://airvpn.org/eddie/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=experimental')
source_x86_64=("airvpn_linux_x64_debian_${pkgver}_experimental.deb"::'https://airvpn.org/eddie/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=experimental')
md5sums_i686=('1efb381a9d2ca9eeee401f6d235281ef')
md5sums_x86_64=('4f888faf59f5517e6974213c7a8b53c7')
sha256sums_i686=('c6db493cb9b85890bfae76291c94033ceb0b3a9580841db9c1b21703c61f43dd')
sha256sums_x86_64=('6372800f621f2c8ea50f2d93d8f85ccb51c38f86245a1c4d6c1d7e9e1b17b9cf')

package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"
  msg2 "Moving stuff in place..."
  install -Dm755 "$srcdir/usr/lib/AirVPN/AirVPN.exe" "$pkgdir/usr/lib/AirVPN/AirVPN.exe"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Common.dll" "$pkgdir/usr/lib/AirVPN/Lib.Common.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Core.dll" "$pkgdir/usr/lib/AirVPN/Lib.Core.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Forms.dll" "$pkgdir/usr/lib/AirVPN/Lib.Forms.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Platforms.Linux.dll" "$pkgdir/usr/lib/AirVPN/Platforms.Linux.dll"
  install -Dm755 "$srcdir/usr/lib/AirVPN/update-resolv-conf" "$pkgdir/usr/lib/AirVPN/update-resolv-conf"
  install -Dm755 "$srcdir/usr/bin/airvpn" "$pkgdir/usr/bin/airvpn"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/changelog.gz" "$pkgdir/usr/share/doc/airvpn/changelog.gz"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/copyright" "$pkgdir/usr/share/doc/airvpn/copyright"
  install -Dm644 "$srcdir/usr/share/man/man8/airvpn.8.gz" "$pkgdir/usr/share/man/man1/airvpn.8.gz"

  ## Fix .desktop file for KDE
  _desktop_session=$(printf "%s" "$DESKTOP_SESSION" | awk -F "/" '{print $NF}')
  if [ "$_desktop_session" = "plasma" ]; then
    msg2 "Installing desktop file for KDE..."
    install -Dm644 "$srcdir/usr/share/pixmaps/AirVPN.png"  "$pkgdir/usr/share/pixmaps/airvpn.png"
    cp "$srcdir/usr/share/applications/AirVPN.desktop" "$srcdir/airvpn.desktop"
    desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
    --dir="$pkgdir/usr/share/applications/" \
    --set-icon="/usr/share/pixmaps/airvpn.png" "airvpn.desktop"
  else
  msg2 "Installing desktop file..."
  install -Dm644 "$srcdir/usr/share/pixmaps/AirVPN.png"  "$pkgdir/usr/share/pixmaps/AirVPN.png"
  desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
  --dir="$pkgdir/usr/share/applications/" "$srcdir/usr/share/applications/AirVPN.desktop"
  fi
}
