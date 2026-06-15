# Maintainer: Jakob Munch Overgaard <jmo@tvipper.com>
pkgname=remotepower-agent
pkgver=4.7.0
pkgrel=1
pkgdesc='RemotePower fleet-management agent: reports host telemetry to a RemotePower server and runs authorized admin tasks'
arch=('any')
url='https://github.com/tyxak/remotepower'
license=('MIT')
depends=('python')
optdepends=(
  'python-psutil: CPU/memory/disk/network metrics in heartbeats'
  'smartmontools: SMART disk-health reporting'
  'lm_sensors: temperature telemetry'
)
install="$pkgname.install"
# Build from the signed GitHub release tarball, PGP-verified against the
# maintainer key (the .asc that `make release` produces).
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/remotepower-$pkgver.tar.gz"
  "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/remotepower-$pkgver.tar.gz.asc"
)
sha256sums=(
  '63b7e724894235812d2be3e4b8a71016e67d422d21fe88b2fd7ed61f3772319a'
  'SKIP'
)
validpgpkeys=('E7B5AD456728B8462A8B54BFD488AF115D2CCDBF')  # Jakob Munch Overgaard <jmo@tvipper.com>

package() {
  cd "remotepower-$pkgver"

  # The agent is a single self-contained Python script (stdlib + optional
  # psutil). Arch packages install to /usr/bin — /usr/local is reserved for
  # the local administrator.
  install -Dm755 client/remotepower-agent "$pkgdir/usr/bin/remotepower-agent"

  # systemd unit. Packaged units live under /usr/lib/systemd/system; repoint
  # ExecStart from upstream's manual-install /usr/local/bin path to /usr/bin.
  install -Dm644 client/remotepower-agent.service \
    "$pkgdir/usr/lib/systemd/system/remotepower-agent.service"
  sed -i 's|/usr/local/bin/remotepower-agent|/usr/bin/remotepower-agent|' \
    "$pkgdir/usr/lib/systemd/system/remotepower-agent.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
