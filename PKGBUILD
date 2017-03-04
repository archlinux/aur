# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.12.2
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, beta version.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(gksu mono openvpn curl)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
provides=('airvpn')
conflicts=('airvpn' 'airvpn-bin')
install=airvpn.install
source_i686=("airvpn_linux_x86_debian_${pkgver}_experimental.deb"::'https://airvpn.org/eddie/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=experimental')
source_x86_64=("airvpn_linux_x64_debian_${pkgver}_experimental.deb"::'https://airvpn.org/eddie/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=experimental')
md5sums_i686=('b8047354c25c3e1b7b41fa8f517d51cd')
md5sums_x86_64=('effa64e564c50de49d0a9f2f0681e923')
sha256sums_i686=('095827275ee56adf689106b37c503c7905f35aae207e05cc2becf1677ebd3c14')
sha256sums_x86_64=('688fbea514abc2d659ab1af8f3286085c2dc11b52d20c2d0ae05bc57480804e3')

package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"
  msg2 "Moving stuff in place..."
  install -Dm755 "$srcdir/usr/lib/AirVPN/AirVPN.exe"          "$pkgdir/usr/lib/AirVPN/AirVPN.exe"
  install -Dm755 "$srcdir/usr/lib/AirVPN/cacert.pem"          "$pkgdir/usr/lib/AirVPN/cacert.pem"
  install -Dm755 "$srcdir/usr/lib/AirVPN/CLI.exe"             "$pkgdir/usr/lib/AirVPN/CLI.exe"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Common.dll"      "$pkgdir/usr/lib/AirVPN/Lib.Common.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Core.dll"        "$pkgdir/usr/lib/AirVPN/Lib.Core.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Forms.dll"       "$pkgdir/usr/lib/AirVPN/Lib.Forms.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Platforms.Linux.dll" "$pkgdir/usr/lib/AirVPN/Platforms.Linux.dll"
  install -Dm755 "$srcdir/usr/lib/AirVPN/update-resolv-conf"  "$pkgdir/usr/lib/AirVPN/update-resolv-conf"
  install -Dm755 "$srcdir/usr/bin/airvpn"                     "$pkgdir/usr/bin/airvpn"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/changelog.gz"  "$pkgdir/usr/share/doc/airvpn/changelog.gz"
  install -Dm644 "$srcdir/usr/share/doc/airvpn/copyright"     "$pkgdir/usr/share/doc/airvpn/copyright"
  install -Dm644 "$srcdir/usr/share/man/man8/airvpn.8.gz"     "$pkgdir/usr/share/man/man1/airvpn.8.gz"

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
