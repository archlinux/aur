# Maintainer: Alexander Couzens <lynxis@fe80.eu>
pkgname=libxtrx-git
pkgver=r51.4f1eb7b5f77c
pkgrel=1
pkgdesc="High level API for the xtrx SDR"
_gitname=libxtrx
arch=('any')
url="https://github.com/xtrx-sdr/libxtrx"
license=('LGPL')
makedepends=('git' 'cmake')
depends=('soapysdr' 'libxtrxll' 'libxtrxdsp' 'qcustomplot-qt5')
source=("git+$url"
        'fix-include-lms.patch')
md5sums=('SKIP'
         '16fd9bed32278a3eea1f1545bfc40334')
provides=('libxtrx')
conflicts=('libxtrx')

pkgver() {
  cd "$srcdir"/$_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  patch -Np1 -i "$srcdir/fix-include-lms.patch"
  mkdir -p build
  cd build

  cmake .. \
    -DBUILD_SHARED_LIBS=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Debug

  make
}

package() {
  cd "$srcdir"/$_gitname/build

  make DESTDIR="$pkgdir" install
}

