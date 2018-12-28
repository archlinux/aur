# Maintainer: Tirr <chwo9843@gmail.com>
pkgname=thtk-git
pkgver=r482.6825664
pkgrel=1
pkgdesc="A collection of tools for exploring and modifying the Touhou game series"
arch=('i686' 'x86_64')
url="https://github.com/thpatch/thtk"
license=('BSD')
depends=('libpng')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname"::'git://github.com/thpatch/thtk.git')
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init extlib/thtypes
  sed -i.old -e '/RPATH/d' CMakeLists.txt
}

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  if [ -d build ]; then
    rm -rf build
  fi
  mkdir -p build
  cd build

  cmake -DWITH_LIBPNG_SOURCE=OFF -DCMAKE_INSTALL_PREFIX="/usr" ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install/strip
  cd ..
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
