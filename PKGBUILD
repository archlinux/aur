# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=qt1-git
pkgver=1.1.2r13.dc8a8d6
pkgrel=1
pkgdesc="Historical copy of Qt 1, adapted to compile on modern systems (circa. 2016)"
arch=('i686' 'x86_64')
url="https://invent.kde.org/historical/qt1"
license=("custom:Qt Free Edition License")
groups=('kde1')
depends=('libxext' 'gcc-libs')
makedepends=('cmake' 'git' 'byacc')
provides=('qt1')
conflicts=('qt1')
source=("git+https://invent.kde.org/historical/qt1.git")
md5sums=('SKIP')

pkgver() {
  cd qt1
  printf "1.1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
  cd qt1
}

build() {
  cd build
  cmake "$srcdir"/qt1 -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/qt1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
