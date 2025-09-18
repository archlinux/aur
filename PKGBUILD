# Maintainer: Lex True <lextruel at pm dot me>
# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Arda Aytekin <aytekin@protonmail.com>

pkgname=vpn-unlimited-bin
_name=${pkgname%-bin}
pkgver=9.0.1
pkgrel=1
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
  iptables
  libcap-ng
  libnl
  lz4
  lzo
  openresolv
  openssl
  qt5-base
  qt5-declarative
  qt5-graphicaleffects
  qt5-quickcontrols2
  qt5-svg
  qt5-webengine
  wireguard-tools
  zlib
)
install=$pkgname.install

source=(
  "https://geo.keepsolidcdn.com/soft/vpn/Linux/vpn-unlimited_$pkgver-amd64.deb"
  "vpn-unlimited-daemon.service"
  "vpn-unlimited.desktop"
  "vpn-unlimited-bin.install"
)
sha256sums=(
  '27e490e6528e776c7d06ec32db5d91edb4f973991043cc49a43f6e0d98150068'
  'dd5ba49842bcbf4c5f722bac2ab3d4c919c676bc29c1ca269678e8a53c0e6a41'
  '039dd8ab8b49dfe20ce055b0069d018bc16706f5d9005503501a85b918635f7e'
  '6a0678ca143102d631960224826a8b20185a6b27289d6662eb5ae7adb61c8858'
)

package() {
  # Extract the Debian package data
  tar --extract --file data.tar.gz --directory "$pkgdir"

  # Remove the /etc directory extracted from the deb, as we manage /etc paths
  # more precisely
  rm --recursive "${pkgdir:?}/etc"

  # Create the /etc/ipsec.d/cacerts/ directory safely
  # The -p flag ensures parent directories are created if they don't exist
  # and does not error if the directory already exists.
  mkdir -p "$pkgdir/etc/ipsec.d/cacerts/"

  # Move binaries from sbin to bin
  find "$pkgdir/usr/sbin" -type f -exec mv '{}' "$pkgdir/usr/bin/" \;
  rm -r "$pkgdir/usr/sbin"

  # Install copyright file and remove original doc directory
  install -Dm644 "$pkgdir/usr/share/doc/vpn-unlimited/copyright" "$pkgdir/usr/share/licenses/$pkgname/copyright"
  rm --recursive "$pkgdir/usr/share/doc"

  # Install desktop file
  rm "$pkgdir/usr/share/applications/vpn-unlimited.desktop"
  install -Dm644 "$srcdir/vpn-unlimited.desktop" "$pkgdir/usr/share/applications/vpn-unlimited.desktop"

  # Ensure shared libraries have executable permissions
  find "$pkgdir/usr/lib" -type f -name "*.so*" -exec chmod +x {} +

  # Set appropriate permissions for user files
  chmod --recursive go-w "$pkgdir/usr"

  # Install systemd service file
  install -Dm644 "$srcdir/vpn-unlimited-daemon.service" "$pkgdir/usr/lib/systemd/system/vpn-unlimited-daemon.service"
}
