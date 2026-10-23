# Maintainer: Booker <lordbooker@gmail.com>
#
# Published to the AUR (package linux-g13-driver-git) by the release workflow
# when a tag is pushed; pkgver is set by pkgver() from the latest tag.

pkgname=linux-g13-driver-git
pkgver=2.6.3.r0.g778afcb
pkgrel=1
pkgdesc="User-space driver and Qt6 configuration tool for the Logitech G13 gameboard (Modernized Fork)"
arch=('x86_64')
url="https://github.com/Lordbooker/linux-g13-driver"
license=('GPL-2.0-only')
depends=('libusb' 'qt6-base' 'gcc-libs' 'glibc')
makedepends=('git' 'cmake' 'qt6-tools')
optdepends=('qt6-translations: translated standard dialog buttons'
            'qt6-wayland: native Wayland sessions')
provides=('linux-g13-driver')
conflicts=('linux-g13-driver' 'g13-driver' 'gkey-config')
install=linux-g13-driver-git.install
source=("linux-g13-driver::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/linux-g13-driver"
  # e.g. 2.6.2.r3.g1a2b3c4 (tag v2.6.2, 3 commits after it)
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "$srcdir/linux-g13-driver/g13-driver" \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
