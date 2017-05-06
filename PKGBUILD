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
  'pkg-config.patch'
)
sha512sums=(
  'SKIP'
  '718a22bd9386d6ba6daf1ea30dd4d18df3a1adc5e9b0cb65cc254aea23f3cb051648010738e589952f794df67cf15e2fa3555005372f96bfffb9fea01cd1b8a7'
)

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  patch -Np1 -i "${srcdir}/pkg-config.patch"
}

build() {
  mkdir -p build
  cd build
  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_MANDIR=/usr/share/man
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