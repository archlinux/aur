# Maintainer: Pablo Arteaga <pablo at pabloarteaga (dot) com>

# This installs a proprietary driver for the XPS13 9300 fingerprint reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-xps9300-bin
_pkgdirname=libfprint-2-tod1-goodix
pkgver=0.0.6
pkgrel=3
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
_commit_id='4a714e9525c1539422e3f8f394ce864253a14ae4'
source=(
    "git+https://git.launchpad.net/~oem-solutions-engineers/libfprint-2-tod1-goodix/+git/libfprint-2-tod1-goodix/#commit=$_commit_id"
    "0001-use-systemd-style-udev-rules.patch")
sha512sums=(
    '0faa902ec926aa0a4b7f322e4e0bed0993020108d3b43c93a7d3055c1f43c3df0ce07ad9bd12069f20f2b522daa52c594f3df97df48cd6da0f6c06cda60a766e'
    '510320656797b2ed01a2a11edb81bd37be54afbfb727c1f52b2a4017a76049752f3ad8cda2b58c036ea264e6c694330276e10f3973adfa699ecd04bd6c61a595')

prepare () {
  cd $_pkgdirname
  patch -p1 -i ../0001-use-systemd-style-udev-rules.patch
}

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
