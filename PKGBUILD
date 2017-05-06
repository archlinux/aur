# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgname=dale-git
_gitname=dale
pkgver=r1036.933e671
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
  "cmake-mandir.patch"
)
sha512sums=(
  'SKIP'
  'dedff6224c9b19d821dc47b8ecf55e2444cf160320b9bcdc8343699575cf6ec4da402ee7d2a9341c491e62b9f179d458c1d01efad226fc09e283f3c2a6fac2a2'
)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  patch -Np1 -i "${srcdir}/cmake-mandir.patch"
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