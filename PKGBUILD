# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>

pkgname=trusttunnel
pkgver=0.9.115
pkgrel=1
pkgdesc="Modern, open-source VPN protocol endpoint by AdGuard"
arch=('x86_64' 'aarch64')
url="https://github.com/TrustTunnel/TrustTunnel"
license=('Apache-2.0')
install=trusttunnel.install
depends=('gcc-libs' 'glibc')
provides=('trusttunnel-endpoint')
conflicts=('trusttunnel-endpoint')

source_x86_64=("trusttunnel-v$pkgver-linux-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel-v$pkgver-linux-x86_64.tar.gz")
source_aarch64=("trusttunnel-v$pkgver-linux-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/trusttunnel-v$pkgver-linux-aarch64.tar.gz")

sha256sums_x86_64=('772e4af5b406e1a0a1ad29904f281bf932cb91228a27f6f0b19614b9dd6a4ee1')
sha256sums_aarch64=('bff555389f42b1b233c048c57ec896afdc1f7c56434efa2aa9816085fb4ae606')

package() {
  if [ "$CARCH" == "x86_64" ]; then
    _dir="trusttunnel-v$pkgver-linux-x86_64"
  elif [ "$CARCH" == "aarch64" ]; then
    _dir="trusttunnel-v$pkgver-linux-aarch64"
  fi

  cd "$_dir"

  # Binaries
  install -Dm755 "trusttunnel_endpoint" "$pkgdir/usr/bin/trusttunnel-endpoint"
  install -Dm755 "setup_wizard" "$pkgdir/usr/bin/trusttunnel-setup-wizard"
  
  # Service (using the official template from the tarball)
  install -Dm644 "trusttunnel.service.template" "$pkgdir/usr/lib/systemd/system/trusttunnel.service"
  
  # Patch the service file to use Arch-standard paths (/usr/bin and /etc)
  sed -i "s|WorkingDirectory=.*|WorkingDirectory=/etc/trusttunnel|" "$pkgdir/usr/lib/systemd/system/trusttunnel.service"
  sed -i "s|ExecStart=.*|ExecStart=/usr/bin/trusttunnel-endpoint /etc/trusttunnel/vpn.toml /etc/trusttunnel/hosts.toml|" "$pkgdir/usr/lib/systemd/system/trusttunnel.service"
  
  # Docs and License
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
