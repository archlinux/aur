# Maintainer: Navon John Lukose <67406856+Magniquick@users.noreply.github.com>

pkgname=intel-igpu-hwmon-dkms-git
_modname=intel-igpu-hwmon
_subdir=intel-igpu-hwmon
pkgver=r2.de3c9e0
pkgrel=1
pkgdesc="hwmon power, temperature and memory clock for Intel integrated GPUs on xe, DKMS"
arch=('any')
url="https://github.com/Magniquick/intel-client-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=('intel-igpu-hwmon-dkms')
conflicts=('intel-igpu-hwmon-dkms')
source=("intel-client-dkms::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd intel-client-dkms
  printf "r%s.%s" "$(git rev-list --count HEAD -- "$_subdir")" \
    "$(git log -1 --format=%h -- "$_subdir")"
}

package() {
  cd "intel-client-dkms/$_subdir"
  local dest="$pkgdir/usr/src/$_modname-$pkgver"

  install -d "$dest"
  install -m644 intel_igpu_hwmon.c Makefile dkms.conf -t "$dest"
  install -m755 build.sh -t "$dest"
  sed -i "s/@PKGVER@/$pkgver/" "$dest/dkms.conf"

  # No PCI ID to autoload on (xe owns the device), so load at boot
  install -Dm644 intel_igpu_hwmon.conf -t "$pkgdir/usr/lib/modules-load.d"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
