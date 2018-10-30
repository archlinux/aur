# Maintainer: Kyle Keen <keenerd@gmail.com>

_pkgname=hobbes
pkgname=hobbes-git
pkgver=20170710
pkgrel=1
pkgdesc="Language, JIT compiler and DB from Morgan Stanley"
url="https://github.com/Morgan-Stanley/hobbes"
arch=('i686' 'x86_64')
license=('APACHE')
depends=('glibc' 'zlib' 'readline' 'gcc-libs')
makedepends=('git' 'llvm40')
conflicts=('hobbes')
provides=('hobbes')
source=("${_pkgname}::git+https://github.com/Morgan-Stanley/${_pkgname}.git"
        '0001-disable-Werror.patch')
sha512sums=(
        'SKIP'
        '273d7445f9229887b3fc55f094c298ba34c86e1d353681f7a3b89e281148b00b37eee8757491550d00d1317bf196bcaaa45ec4abb9ff665c913194c9f6819197')
options=('staticlibs')

# requires llvm 3.X or 4.0.X

# Appears to static link everything?  Could shave off 36MB, maybe.

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i ../0001-disable-Werror.patch
}

build() {
  cd "$srcdir/$_pkgname"
  mkdir -p build
  cd build
  PATH="/usr/lib/llvm-4.0/bin:$PATH" cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname/build"
  make DESTDIR="$pkgdir" install
}
