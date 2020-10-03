# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>
# Contributor: Vaporeon <vaporeon@vaporeon.io>

pkgname=kde1-kdelibs-git
pkgver=1.1.2r3049.cc31c174
pkgrel=1
pkgdesc="Historical copy of the libraries module of KDE 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/kde1-kdelibs"
license=("GPL2" "LGPL2")
groups=('kde1')
depends=('qt1' 'libpng' 'libjpeg-turbo' 'libtiff')
makedepends=('cmake' 'git')
provides=('kde1-kdelibs')
conflicts=('kde1-kdelibs')
source=("git+https://invent.kde.org/historical/kde1-kdelibs.git")
md5sums=('SKIP')

pkgver() {
  cd kde1-kdelibs
  printf "1.1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake ../kde1-kdelibs \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd ../kde1-kdelibs
  install -Dm644 COPYING \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 COPYING.LIB \
    "$pkgdir"/usr/share/licenses/$pkgname/COPYING.LIB
}
