# $Id$
# Maintainer: Léo Flaventin Hauchecorne <hl037.prog@gmail.com>
# Base Package Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

_pkgbasename=libuv
pkgname=lib32-$_pkgbasename
pkgver=1.23.2
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

sha512sums=('f91accf4ba9987fad23cc546a9821c3d643f8505cae22e0cbe28c4d5d5cb6b370b3483c6d95195cff3bcddd1e94f1bdab740075c3eaf22f8f673f7a57c1fdfc5')
