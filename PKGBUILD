# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ksnip-git
pkgver=r261.44c9092
pkgrel=1
pkgdesc='Screenshot tool inspired by Windows Snipping Tool and made with Qt for Linux'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/ksnip'
license=('GPL')
depends=(qt5-x11extras)
makedepends=(git cmake extra-cmake-modules qt5-tools)
source=('git+https://github.com/DamirPorobic/ksnip.git')
_gitname='ksnip'
md5sums=(SKIP)

prepare(){
  cd "$srcdir/$_gitname"
  test -d build || mkdir build
  sed "s#DESTINATION /bin#DESTINATION /usr/bin#" -i CMakeLists.txt
}
pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
build(){
  cd "$srcdir/$_gitname/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}
package(){
  cd "$srcdir"/$_gitname/build
  make DESTDIR="$pkgdir" install
}

