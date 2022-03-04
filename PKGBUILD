pkgname=kimageannotator-git
pkgver=r1096.c2919a5
pkgrel=1
pkgdesc='Tool for annotating images'
arch=('i686' 'x86_64')
url='https://github.com/DamirPorobic/kimageannotator'
license=('GPL')
depends=(
  qt5-base
  qt5-svg
)
makedepends=(
  git
  cmake
  extra-cmake-modules
  qt5-tools
  kcolorpicker-git
  chrpath
)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+$url.git")
sha256sums=('SKIP')

prepare(){
  cd ${pkgname%-git}
  test -d build || mkdir build
  sed 's@^add_subdirectory.*kColorPicker@#&@' -i CMakeLists.txt
}
pkgver(){
  cd ${pkgname%-git}
  set -o pipefail
  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
  cd ${pkgname%-git}/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=ON ..
  make
}
package(){
  cd ${pkgname%-git}/build
  make DESTDIR="$pkgdir" install
  cd "$pkgdir"/usr
  install -dm755 bin
  install -Dm555 "$srcdir/kimageannotator/build/example/kImageAnnotator-example" bin/kImageAnnotator-example
  strip "$pkgdir/usr/bin/kImageAnnotator-example"
  chrpath -d "$pkgdir/usr/bin/kImageAnnotator-example"
}

