_target=arm-none-eabi
pkgname=$_target-picolibc
pkgver=1.8.11
pkgrel=1
pkgdesc='Fork of newlib with stdio bits from avrlibc'
arch=('i686' 'x86_64')
url='https://github.com/picolibc/picolibc'
license=('BSD')
makedepends=("$_target-gcc" 'meson')
source=("picolibc-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('28e60a2d218da70c71278708887adc5ecb0843ed31579dcb691e82d7567c203f')
options=(!strip !buildflags)

build() {
  meson \
    --prefix="/usr/$_target"/picolibc \
    --cross-file "picolibc-$pkgver/scripts/cross-${_target}.txt" \
    -Dspecsdir="/usr/$_target/lib" \
    -Dsystem-libc=false \
    --buildtype=plain \
    "picolibc-$pkgver" build

  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/picolibc-$pkgver/COPYING.picolibc"
}

# vim: set ts=2 sw=2 et:
