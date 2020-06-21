# Maintainer: Pablo Arteaga <pablo at pabloarteaga (dot) com>

# This installs a proprietary driver for the XPS13 9300 fingerprint reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-xps9300-bin
_pkgdirname=libfprint-2-tod1-goodix
pkgver=0.0.6
pkgrel=1
pkgdesc="Proprietary driver for the fingerprint reader on the Dell XPS 13 9300 - direct from Dell's Ubuntu repo"
arch=(x86_64)
url="https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-goodix/+git/libfprint-2-tod1-goodix/"
license=(custom)
depends=(libfprint-tod)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
groups=(fprint)
source=("git+https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-goodix/+git/libfprint-2-tod1-goodix/#branch=devel")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgdirname
  sed -n -r 's/^libfprint.* \(([0-9\.]+).*/\1/p' ./debian/changelog | head --lines=1
}

build() {
  cd $_pkgdirname
  sed -n -r '/Shenzhen/,/^\s*$/p' debian/copyright > LICENSE
  if [[ ! -s LICENSE ]]; then
    # Could not extract the specific bits from the copyright file, write it all out
    cp debian/copyright LICENSE
  fi
}

package() {
  cd $_pkgdirname
  # Create target directories in the package and use -Dm after to avoid repeating long filenames
  install -dm 755 "$pkgdir/usr/lib/libfprint-2/tod-1/"
  install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Driver
  install -Dm 755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/libfprint-tod-goodix-53xc-$pkgver.so "$pkgdir/usr/lib/libfprint-2/tod-1/"
  # udev rule
  install -Dm 755 lib/udev/rules.d/60-libfprint-2-tod1-goodix.rules "$pkgdir/usr/lib/udev/rules.d/"
}
