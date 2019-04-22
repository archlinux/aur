# Maintainer: Alexander Couzens <lynxis@fe80.eu>
pkgname=libxtrxdsp-git
_gitname=libxtrxdsp
pkgver=r8.b166ad69493e
pkgrel=1
pkgdesc="DSP specific function for SDR in general and XTRX in specific"
arch=('any')
url="https://github.com/xtrx-sdr/libxtrxdsp"
license=('LGPL')
makedepends=('git' 'cmake')
source=("git+$url"
        "fix-cmake.patch")
md5sums=('SKIP'
         '286caa8cd9a01b1bd0c667d7c3b9eb3c')

pkgver() {
  cd "$srcdir"/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  patch -Np1 -i "$srcdir/fix-cmake.patch"
  mkdir -p build
  cd build

  cmake .. \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"/$_gitname/build

  make DESTDIR="$pkgdir" install
}

