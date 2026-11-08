# Maintainer: akuma <exyexin@gmail.com>

_pkgname=darmoshark-battery
pkgname=${_pkgname}-dkms-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Darmoshark (MOJI) mouse battery exposed as a Linux power supply (DKMS)"
arch=('any')
url="https://github.com/ayasaki-exs/darmoshark-battery"
license=('GPL-2.0-or-later')
# The dkms pacman hook compiles the module after installation, so the BTF
# generator belongs in depends, not makedepends. The matching kernel headers
# (dkms optdepends, e.g. linux-headers) pull pahole as well.
depends=('dkms' 'pahole')
makedepends=('git')
provides=("${_pkgname}-dkms")
conflicts=("${_pkgname}-dkms")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null \
      | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
      || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

check() {
  cd "$_pkgname"
  make test
}

package() {
  cd "$_pkgname"

  # The Arch dkms pacman hook scans /usr/src/*/dkms.conf and builds/installs
  # the module for every installed kernel; the package only ships the source.
  # Keep the directory name and PACKAGE_VERSION in sync with the last tag, the
  # way nvidia-dkms and other DKMS packages do.
  local tagver
  tagver=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')
  [[ -n $tagver ]] || tagver=$pkgver

  install -d "$pkgdir/usr/src/${_pkgname}-${tagver}"
  cp -a . "$pkgdir/usr/src/${_pkgname}-${tagver}/"
  rm -rf "$pkgdir/usr/src/${_pkgname}-${tagver}/.git" \
    "$pkgdir/usr/src/${_pkgname}-${tagver}/build" \
    "$pkgdir/usr/src/${_pkgname}-${tagver}/packaging"
  sed -i "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"${tagver}\"/" \
    "$pkgdir/usr/src/${_pkgname}-${tagver}/dkms.conf"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Load the module at boot. The module also matches the HID modalias, so udev
  # can load it on hotplug; this makes cold boot deterministic.
  install -d "$pkgdir/usr/lib/modules-load.d"
  printf 'darmoshark_battery\n' \
    > "$pkgdir/usr/lib/modules-load.d/darmoshark-battery.conf"
}
