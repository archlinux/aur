# Maintainer: Adrian Holfter < aholfter PLUS aur AT googlemail DOT com >
pkgname=laslib-git
pkgver=r267.2079ea0
pkgrel=1
pkgdesc="LASlib is a C++ programming API for reading / writing LIDAR data stored in standard LAS format."
arch=('i686' 'x86_64')
url="http://lastools.org/"
license=('LGPL')
source=("git+https://github.com/LAStools/LAStools.git")
md5sums=('SKIP')

pkgver() {
    cd "LAStools"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/LAStools"
  make
}

package() {
  # LASzip include headers are needed, too
  cd "$srcdir/LAStools/LASzip/src"
  find . -iname "*.hpp" -exec install -Dm644 {} "$pkgdir/usr/include/laslib/{}" \;

  # install LASlib include headers
  cd "$srcdir/LAStools/LASlib/inc"
  find . -exec install -Dm644 {} "$pkgdir/usr/include/laslib/{}" \;

  # install library
  cd "$srcdir/LAStools/LASlib/"
  install -Dm644 "$srcdir/LAStools/LASlib/lib/liblas.a" "$pkgdir/usr/lib/liblaslib.a"
}
