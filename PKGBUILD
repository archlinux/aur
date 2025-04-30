# Maintainer:	       EndlessEden <endlesseden@users.noreply.github.com>
# Previous Maintainer: heliochronix <heliochronix@gmail.com>

pkgname=libfec-git
pkgver=1.0.r10.g9750ca0
pkgrel=1
pkgdesc="Phil Karn's FEC (Forward Error Correction) library"
arch=('x86_64' 'aarch64')
url="https://github.com/quiet/libfec"
license=('LGPL2.1')
makedepends=('git' 'cmake')
provides=('libfec' "$pkgname" "libfec.so=$pkgver")
conflicts=('libfec')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd libfec

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p libfec/build
  cd libfec/build

if [ "$(cmake --version | head -1 | sed -e 's| |\n|g' | tail -1 | sed -e 's|.[0-9]|\n|g' | head -1)" -gt "3" ]; then

echo "cmake version: $(cmake --version | head -1 | sed -e 's| |\n|g' | tail -1)"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release

else

  echo "cmake version: $(cmake --version | head -1 | sed -e 's| |\n|g' | tail -1)"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
fi

  make
}

check() {
  cd libfec/build

  make test_all
}

package() {
  cd libfec/build

  make DESTDIR="$pkgdir" install
}
