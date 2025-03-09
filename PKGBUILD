# Maintainer: Aaron Cottle <aaron at aaroncottle (dot) com (dot) au>

# This installs a proprietary driver for the 0a5c:5843 fingerprint reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-broadcom
_pkgdirname=libfprint-2-tod1-broadcom
pkgver=5.14.003.0
pkgrel=1
pkgdesc="Proprietary driver for the fingerprint reader on the Dell Latitude 7300 - direct from Dell's Ubuntu repo"
arch=(x86_64)
url="https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom/"
license=(custom)
depends=(libfprint-tod)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
groups=(fprint)
source=("git+https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-broadcom/+git/libfprint-2-tod1-broadcom/#branch=upstream")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  sed -n 's/.*version: \([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p' ./var/lib/fprint/fw/bcm_cv_current_version.txt
}

package() {
  cd $_pkgdirname
  # Create target directories in the package and use -Dm after to avoid repeating long filenames
  install -dm 755 "$pkgdir/usr/lib/libfprint-2/tod-1/"
  install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"
  install -dm 755 "$pkgdir/var/lib/fprint/fw/"

  # licence
  install -Dm 644 ./LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # drivers
  install -Dm 755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/libfprint-2-tod-1-broadcom.so "$pkgdir/usr/lib/libfprint-2/tod-1/"
  # udev rules
  cp -r lib/udev/rules.d/* "$pkgdir/usr/lib/udev/rules.d/"
  # firmware
  cp -r var/lib/fprint/fw/* "$pkgdir/var/lib/fprint/fw/"
}
