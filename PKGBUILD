# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.14.2
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
md5sums_i686=('c4b51e9f92f72e00b9fec0905dc72581')
md5sums_x86_64=('b62b6363109a2b7665cf4e687b66c32f')
sha256sums_i686=('d7068dd01c0a4c51f7eedd1b37d951e07e2774df59e0388f92cc47c2e7946b82')
sha256sums_x86_64=('24701c23bf2a159bacf281891f19386381796f01df774dc7cb61b21440cc622f')

package() {
  cd "$srcdir"
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"

  msg2 "Moving stuff in place..."
  for _file in usr/{bin/*,lib/AirVPN/*,share/{AirVPN/*,doc/airvpn/*,man/man8/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
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
