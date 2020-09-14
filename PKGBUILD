# Maintainer: Yevhenii Kolesnikov <sigexp.acc at gmail dot com>

_pkgname=gfxreconstruct
pkgname=$_pkgname-git
pkgver=v0.9.2.r13.g8b3114a
pkgrel=1
pkgdesc="Graphics API Capture and Replay Tools for Reconstructing Graphics Application Behavior"
arch=('x86_64')
url="https://github.com/LunarG/gfxreconstruct"
license=('Apache')
depends=("python" "libx11" "libxcb" "xcb-util-keysyms" "wayland" "libxrandr" "zlib" "lz4" "zstd")
makedepends=("git" "cmake>=3.4")
provides=($_pkgname)
source=($_pkgname::git+https://github.com/LunarG/gfxreconstruct.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule update --init
}

build() {
  cd $_pkgname
  cmake . -B build_$arch \
          -D CMAKE_INSTALL_PREFIX=/usr
  make -C build_$arch
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" make -C build_$arch install

  # Remove .py file extension from files that are going to /usr/bin/
  for f in $pkgdir/usr/bin/*.py; do
    mv -v $f `echo $f | sed 's/\.py//'`
  done
}
