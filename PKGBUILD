# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Arda Aytekin <aytekin@protonmail.com>

pkgname=vpn-unlimited-bin
_name=${pkgname%-bin}
pkgver=8.5.2
pkgrel=5
pkgdesc="VPN Unlimited client application"
arch=(x86_64)
url="https://www.vpnunlimitedapp.com"
license=(custom)
provides=("$_name")
conflicts=("$_name")
depends=(
  bash
  boost174-libs
  c-ares
  curl
  gcc-libs
  glibc
  hicolor-icon-theme
  lsb-release
  lzo
  net-tools
  openresolv
  openssl
  openvpn
  qt5-base
  qt5-webengine
  strongswan
  wireguard-tools
  zlib
)

source=(
  "https://geo.keepsolidcdn.com/soft/vpn/Linux/VPN_Unlimited_${pkgver}_amd64_mint.deb"
  "vpn-unlimited-daemon.service"
  "vpn-unlimited.desktop"
)
sha256sums=(
  '43ed1a73d97dd33a87b77d319a9e0391a1077b8a0fe77190f13ae690b584a7ae'
  'dd5ba49842bcbf4c5f722bac2ab3d4c919c676bc29c1ca269678e8a53c0e6a41'
  '039dd8ab8b49dfe20ce055b0069d018bc16706f5d9005503501a85b918635f7e'
)

package() {
  tar --extract --file data.tar.gz --directory "$pkgdir"

  rm --recursive "${pkgdir:?}/etc"

  find "$pkgdir/usr/sbin" -type f -exec mv '{}' "$pkgdir/usr/bin/" \;
  rm -r "$pkgdir/usr/sbin"

  install -Dm644 "$pkgdir/usr/share/doc/vpn-unlimited/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
  rm --recursive "$pkgdir/usr/share/doc"

  rm "$pkgdir/usr/share/applications/vpn-unlimited.desktop"
  install -Dm644 "$srcdir/vpn-unlimited.desktop" "$pkgdir/usr/share/applications/vpn-unlimited.desktop"

  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod +x {} +

  chmod --recursive go-w "$pkgdir/usr"

  install -Dm644 "vpn-unlimited-daemon.service" "$pkgdir/usr/lib/systemd/system/vpn-unlimited-daemon.service"
}
