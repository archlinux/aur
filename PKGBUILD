# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tinyxml-git
pkgver=r1.g94b1760
pkgrel=2
pkgdesc="A simple, small, efficient, C++ XML parser"
arch=('i686' 'x86_64')
url="http://www.grinninglizard.com/tinyxml/"
license=('zlib')
depends=('gcc-libs')
makedepends=('git' 'setconf')
provides=("tinyxml=$pkgver")
conflicts=('tinyxml')
source=("git+https://git.code.sf.net/p/tinyxml/git"
        "tinyxml.pc::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/tinyxml/trunk/tinyxml.pc")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "git"

  setconf Makefile TINYXML_USE_STL YES
  setconf Makefile RELEASE_CFLAGS "$CXXFLAGS -fPIC"
}

pkgver() {
  cd "git"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "git"

  make
  g++ "$CXXFLAGS" -fPIC -shared -o "libtinyxml.so" \
    -Wl,-soname,"libtinyxml.so" $(ls *.o | grep -v xmltest)
}

check() {
  cd "git"

  ./xmltest
}

package() {
  cd "git"

  install -dm 755 "$pkgdir/usr"/{lib,include}
  install -Dm 755 "libtinyxml.so" -t "$pkgdir/usr/lib"
  install -Dm 644 {tinyxml,tinystr}.h -t "$pkgdir/usr/include"

  install -Dm644 "$srcdir/tinyxml.pc" -t "$pkgdir/usr/lib/pkgconfig"

  install -Dm644 "readme.txt" "$pkgdir/usr/share/licenses/tinyxml/LICENSE"
}
