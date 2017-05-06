# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname=dale-git
_gitname=dale
pkgver=r1038.760bb29
pkgrel=1
pkgdesc='Lisp-flavoured C'
url='https://github.com/tomhrr/dale/'
arch=('x86_64' 'i686')
license=('BSD')
depends=('libffi' 'zlib' 'gcc-libs-multilib' 'ncurses')
makedepends=('git' 'cmake' 'pkg-config' 'llvm35')
provides=('dale')
source=(
  "git+https://github.com/tomhrr/${_gitname}.git"
)
sha512sums=(
  'SKIP'
)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p build
  cd build
  # for some reason cmake can't find libffi... this is probably a problem with CMakeLists.txt, but for now I'm working around it:
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MANDIR=/usr/share/man -DFFI_INCLUDE_DIR=$(pkg-config --cflags-only-I libffi | cut -b3-)
  make
}

check() {
  cd build
  make tests
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  cd ../$_gitname
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}