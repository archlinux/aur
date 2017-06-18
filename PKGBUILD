# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.13.1
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
md5sums_i686=('9e53e2047b194b0239a26645b08ef090')
md5sums_x86_64=('47297bb184d2c8625d883ac6c647f3a6')
sha256sums_i686=('e7cec03d74930a8f66948256201673b9b2debfd4aeeb31c8f5c97a46e0c36354')
sha256sums_x86_64=('5a95394fac980baa88f6909f30439070729199d20550e1cf38f84b956f83d6d8')

package() {
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"
  msg2 "Moving stuff in place..."
  install -Dm755 "$srcdir/usr/lib/AirVPN/AirVPN.exe"          "$pkgdir/usr/lib/AirVPN/AirVPN.exe"
  install -Dm755 "$srcdir/usr/lib/AirVPN/CLI.exe"             "$pkgdir/usr/lib/AirVPN/CLI.exe"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Common.dll"      "$pkgdir/usr/lib/AirVPN/Lib.Common.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Core.dll"        "$pkgdir/usr/lib/AirVPN/Lib.Core.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Lib.Forms.dll"       "$pkgdir/usr/lib/AirVPN/Lib.Forms.dll"
  install -Dm644 "$srcdir/usr/lib/AirVPN/Platforms.Linux.dll" "$pkgdir/usr/lib/AirVPN/Platforms.Linux.dll"
  install -Dm755 "$srcdir/usr/lib/AirVPN/update-resolv-conf"  "$pkgdir/usr/lib/AirVPN/update-resolv-conf"
  install -Dm755 "$srcdir/usr/bin/airvpn"                     "$pkgdir/usr/bin/airvpn"
  install -Dm755 "$srcdir/usr/share/AirVPN/cacert.pem"        "$pkgdir/usr/share/AirVPN/cacert.pem"
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
