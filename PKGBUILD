# $Id$
# Maintainer: Léo Flaventin Hauchecorne <hl037.prog@gmail.com>
# Base Package Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_pkgbasename=libuv
pkgname=lib32-$_pkgbasename
pkgver=1.23.1
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

sha512sums=('5c3170dea49d7954f5780bc94d5c021a8e1bf91e2d17188335825f1dc1098a8826d5eb9dac4be318ec68275888d0dfa9579a841d43de0c3520c89ab0dc70e5ab')
