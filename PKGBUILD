# Maintainer: Darvin Delgado <dnmodder at gmail dot com>

_pkgname=cpuid_fault_emulation
pkgname=cpuid-fault-emulation-dkms
pkgver=0.1
pkgrel=1
pkgdesc="DKMS kernel module for CPUID fault emulation on AMD processors with systemd service and polkit support"
arch=('x86_64')
url="https://github.com/dnmodder/cpuid-fault-emulation"
license=('GPL')
depends=('dkms')
optdepends=(
  'polkit: allow non-root users in wheel group to start/stop the service'
)
provides=("$_pkgname-dkms")
conflicts=("$_pkgname-dkms")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f842fe5f173675632c12dac33e5a5cfd8ac462cadf8dfc2ffd74278796f9001e')

package() {
  cd "cpuid-fault-emulation-$pkgver"

  local _destdir="$pkgdir/usr/src/$_pkgname-$pkgver"
  install -dm755 "$_destdir"

  # Install module sources for DKMS
  cp -r dkms.conf Makefile inc src "$_destdir/"

  # Install systemd service and hardened helper
  install -Dm644 cpuid-fault-emulation.service "$pkgdir/usr/lib/systemd/system/cpuid-fault-emulation.service"
  install -Dm755 cpuid-fault-emulation-helper "$pkgdir/usr/lib/cpuid-fault-emulation/cpuid-fault-emulation-helper"

  # Install Polkit rule allowing wheel group users to start/stop the service without password
  install -Dm644 10-cpuid-fault-emulation.rules "$pkgdir/usr/share/polkit-1/rules.d/10-cpuid-fault-emulation.rules"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
