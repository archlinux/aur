# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: jwm-art <jwm.art.net at gmail.com>

pkgname=jack-keyboard
pkgver=2.7.1
pkgrel=1
pkgdesc="A virtual MIDI keyboard for JACK."
arch=('i686' 'x86_64')
url="http://jack-keyboard.sourceforge.net/"
license=('BSD')
depends=('lash')
makedepends=('cmake')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b89c9ac03e850ad1aa8b33ff62ea06a8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # man path fix
  sed -i "s| man/man| share/man/man|" CMakeLists.txt

  # prevent bad assert failure with ladish
  sed -i "/assert (event)/d" src/$pkgname.c

  # fix undefined reference to symbol 'g_thread_init'
  sed -i "s|g_thread_init(NULL);|/*g_thread_init(NULL);*/|" src/jack-keyboard.c

  [ -d build ] || mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 ../COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}