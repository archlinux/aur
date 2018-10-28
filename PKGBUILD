# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kimageannotator-git
pkgver=r309.c498edf
pkgrel=1
pkgdesc='Tool for annotating images'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/kImageAnnotator'
license=('GPL')
depends=()
makedepends=(
  git
  cmake
  extra-cmake-modules
  qt5-tools
  kcolorpicker-git
)
provides=(
  kimageannotator
)
source=('git+https://github.com/DamirPorobic/kImageAnnotator.git')
_gitname='kImageAnnotator'
md5sums=(SKIP)

prepare(){
  cd "$srcdir/$_gitname"
  test -d build || mkdir build
#   sed "s#DESTINATION /bin#DESTINATION /usr/bin#" -i CMakeLists.txt
  sed 's@^add_subdirectory.*kColorPicker@#&@' -i CMakeLists.txt
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

