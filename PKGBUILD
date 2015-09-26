# Maintainer: Beini <bane aτ iki dot fi>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-git
pkgver=r186.83eae96
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(gksu mono openvpn desktop-file-utils)
makedepends=(git)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
provides=('airvpn')
conflicts=('airvpn' 'airvpn-beta-bin')
install=airvpn-git.install
source=('git+https://github.com/AirVPN/airvpn-client.git')
sha1sums=('SKIP')

case "$CARCH" in
    i686) _pkgarch="x86"
      ;;
    x86_64) _pkgarch="x64"
      ;;
esac

pkgver() {
  cd "airvpn-client"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "airvpn-client"
  xbuild /p:Configuration="Release" /p:Platform="$_pkgarch" src/AirVPN.sln
}

package() {
  cd "airvpn-client"
  install -Dm755 "src/bin/$_pkgarch/Release/UI.Linux.exe" "$pkgdir/usr/lib/AirVPN//AirVPN.exe"
  install -Dm644 "src/bin/$_pkgarch/Release/Lib.Core.dll" "$pkgdir/usr/lib/AirVPN/Lib.Core.dll"
  install -Dm644 "src/bin/$_pkgarch/Release/Lib.Forms.dll" "$pkgdir/usr/lib/AirVPN/Lib.Forms.dll"
  install -Dm644 "src/bin/$_pkgarch/Release/Platforms.Linux.dll" "$pkgdir/usr/lib/AirVPN/Platforms.Linux.dll" 
  install -Dm755 "deploy/linux_$_pkgarch/update-resolv-conf" "$pkgdir/usr/lib/AirVPN/update-resolv-conf"
  install -Dm755 "resources/debian/usr/bin/airvpn" "$pkgdir/usr/bin/airvpn"
  
  install -Dm644 "resources/debian/usr/share/pixmaps/AirVPN.png" "$pkgdir/usr/share/pixmaps/AirVPN.png"
  desktop-file-install -m 644 --set-comment="VPN service based on OpenVPN"\
    --dir="$pkgdir/usr/share/applications/" --add-category="Qt;KDE"\
    "resources/debian/usr/share/applications/AirVPN.desktop"
}
