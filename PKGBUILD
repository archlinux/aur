# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Arda Aytekin <aytekin@protonmail.com>

pkgname=vpn-unlimited
pkgver=8.5.2
pkgrel=1
pkgdesc="VPN Unlimited client application"
arch=(x86_64)
url="https://www.vpnunlimitedapp.com"
license=(custom)
makedepends=(
  patchelf
)
depends=(
  qt5-script
  qt5-webkit
  openvpn
  openresolv
  net-tools
  c-ares
  lsb-release
  strongswan
  qt5-webengine
  openssl-1.1
  wireguard-tools
  boost-libs=1.74.0
)
install=vpn-unlimited.install

source=(
  "https://geo.keepsolidcdn.com/soft/vpn/Linux/VPN_Unlimited_${pkgver}_amd64_mint.deb"
  "vpn-unlimited-daemon.service"
)
sha256sums=(
  '43ed1a73d97dd33a87b77d319a9e0391a1077b8a0fe77190f13ae690b584a7ae'
  'dd5ba49842bcbf4c5f722bac2ab3d4c919c676bc29c1ca269678e8a53c0e6a41'
)

package() {
  tar --extract --file data.tar.gz --directory "$pkgdir"

  rm --recursive "$pkgdir/etc"

  find "$pkgdir/usr/sbin" -type f -exec mv '{}' "$pkgdir/usr/bin/" \;
  rm -r "$pkgdir/usr/sbin"

  install -Dm644 "$pkgdir/usr/share/doc/vpn-unlimited/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
  rm --recursive "$pkgdir/usr/share/doc"

  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod +x {} +

  chmod --recursive go-w "$pkgdir/usr"

  files=(
    $pkgdir/usr/bin/vpn-unlimited
    $pkgdir/usr/bin/vpn-unlimited-daemon
    $pkgdir/usr/lib/libvpnu_private_sdk.so.1.0.0
  )
  for file in "${files[@]}"; do
    patchelf --replace-needed libcrypto.so.3  libcrypto.so.1.1 "$file"
    patchelf --replace-needed libssl.so.3  libssl.so.1.1 "$file"
  done

  install -Dm644 "vpn-unlimited-daemon.service" "$pkgdir/usr/lib/systemd/system/vpn-unlimited-daemon.service"
}
