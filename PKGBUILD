# $Id$
# Maintainer: Léo Flaventin Hauchecorne <hl037.prog@gmail.com>
# Base Package Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_pkgbasename=libuv
pkgname=lib32-$_pkgbasename
pkgver=1.23.0
pkgrel=1
pkgdesc="Multi-platform support library with a focus on asynchronous I/O"
arch=('x86_64')
url="https://github.com/libuv/libuv"
license=('custom')
depends=('lib32-glibc')
makedepends=('python-sphinx' 'gcc-multilib')
source=("https://github.com/libuv/libuv/archive/v$pkgver/$_pkgbasename-$pkgver.tar.gz")

build() {
   export CC="gcc -m32"
   export CXX="g++ -m32"
   export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

   cd "$srcdir"/$_pkgbasename-$pkgver
   ./autogen.sh
   ./configure \
      --host='i686-pc-linux-gnu' \
      --prefix='/usr' \
      --libdir='${exec_prefix}/lib32' \
      "CFLAGS=-Ofast" "CXXFLAGS=-Ofast" "LDFLAGS=-Ofast"
   make
}

check() {
   cd "$srcdir"/$_pkgbasename-$pkgver
   make check
}

package() {
   cd "$srcdir"/$_pkgbasename-$pkgver

   make DESTDIR="$pkgdir" install

   rm -rf "${pkgdir}"/usr/{include,share,bin}
   mkdir -p "$pkgdir/usr/share/licenses"
   ln -s $_pkgbasename "$pkgdir/usr/share/licenses/$pkgname"
}

sha512sums=('d1622ea9c03661ce2dfa18e1725fc1bfdf3b16d7e40babc552dcc5b2f86d52f4dd81cac9bf89914024b11e4ed3671264dfcfba867cfa3b1a2206b89c59c95851')
