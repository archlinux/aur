# Maintainer: Milkii Brewster (milkii on freenode)
# Creator: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=gimp-plugin-texturize-git
pkgver=2.2
pkgrel=1
pkgdesc="Generates large textures from a small sample"
arch=('i686' 'x86_64')
url="http://github.com/lmanul/gimp-texturize/"
license=('GPL')
depends=('gimp')
makedepends=('perl-xml-parser')
source=(git+https://github.com/lmanul/gimp-texturize)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
 }

prepare() {
  cd "${srcdir}/gimp-texturize-master"
  ./autogen.sh
}

build() {
  cd "$srcdir"/gimp-texturize-master
  # fix the build with recent versions of gimp
  # find . -type f -name "*.c" -exec sed -i '/.*gimpimage_pdb.h.*/ d' '{}' ';'
  # find . -type f -name "*.cpp" -exec sed -i '/.*gimpimage_pdb.h.*/ d' '{}' ';'
  make
}

package() {
  cd "$srcdir"/gimp-texturize-master
  make DESTDIR="$pkgdir" install
}
