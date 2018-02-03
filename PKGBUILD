# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.14.0
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
md5sums_i686=('d06b15b13dab3392ad175701419b42d7')
md5sums_x86_64=('76e2a3c5ecbf93a3218acba7ccb257a9')
sha256sums_i686=('d19cba137377fe1391750bf72711add717f93b2014791fc7b0056636dc9e3b43')
sha256sums_x86_64=('e41dece292d91f2574e07a268774a76e73d9f14b4eed91bfaa94b430f9d0bd0b')

package() {
  cd "$srcdir"
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"
  msg2 "Moving stuff in place..."

  for i in usr/{bin/airvpn,lib/AirVPN/{*.exe,eddie_tray,*-conf}}; do
      install -Dm755 $i "$pkgdir"/$i
  done

  for i in usr/{lib/AirVPN/{*.dll,*.so},share/{AirVPN/*,doc/airvpn/*,man/man8/*}}; do
      install -Dm644 $i "$pkgdir"/$i
  done

  ## Fix .desktop file for KDE
  _desktop_session=$(printf "%s" "$DESKTOP_SESSION" | awk -F "/" '{print $NF}')
  if [ "$_desktop_session" = "plasma" ]; then
    msg2 "Installing desktop file for KDE..."
    install -Dm644 "$srcdir/usr/share/pixmaps/AirVPN.png"  "$pkgdir/usr/share/pixmaps/airvpn.png"
    cp "$srcdir/usr/share/applications/AirVPN.desktop" "$srcdir/airvpn.desktop"
    desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
    --dir="$pkgdir/usr/share/applications/" \
    --set-icon="/usr/share/pixmaps/airvpn.png" "$srcdir/airvpn.desktop"
  else
    msg2 "Installing desktop file..."
    install -Dm644 "$srcdir/usr/share/pixmaps/AirVPN.png"  "$pkgdir/usr/share/pixmaps/AirVPN.png"
    desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
    --dir="$pkgdir/usr/share/applications/" "$srcdir/usr/share/applications/AirVPN.desktop"
  fi
}
