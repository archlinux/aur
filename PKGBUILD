# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=laslib-git
pkgver=2.0.3.r65.g29a7174
pkgrel=1
pkgdesc="LASlib is a C++ programming API for reading / writing LIDAR data stored in standard LAS format."
arch=('i686' 'x86_64')
url="http://lastools.org/"
license=('LGPL')
provides=('laslib')
conflicts=('laslib')

source=("git+https://github.com/LAStools/LAStools.git")
sha256sums=('SKIP')

pkgver() {
    cd "LAStools"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/LAStools"
  rm -rf build
  mkdir build
  cd build
  cmake "$srcdir/LAStools" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_BUILD_TYPE=Release \

  make
}

package() {
  cd "$srcdir/LAStools/build"
  make DESTDIR="${pkgdir}" install

  # Remove binaries that are part of LAStools - if you need them, install lastools-git.
  rm -rf "${pkgdir}/usr/bin"
}
