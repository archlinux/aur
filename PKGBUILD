# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kcolorpicker-git
pkgver=r38.e993ea4
pkgrel=1
pkgdesc='Qt basd Color Picker with popup menu'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/kColorPicker'
license=('GPL')
depends=(
  qt5-x11extras
)
makedepends=(
  extra-cmake-modules
  qt5-tools
)
source=('git+https://github.com/DamirPorobic/kColorPicker.git')
_gitname='kColorPicker'
md5sums=(SKIP)

prepare(){
  cd "$srcdir/$_gitname"
  test -d build || mkdir build
#   sed "s#DESTINATION /bin#DESTINATION /usr/bin#" -i CMakeLists.txt
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
  cd "$pkgdir"/usr
  mv lib64 lib
}

