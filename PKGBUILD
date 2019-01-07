# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

_target=riscv64-linux-gnu
_pkgname=pkg-config
pkgname=${_target}-pkg-config
pkgver=0.29.2
pkgrel=1
pkgdesc="pkg-config that only looks in /usr/${_target}/lib/pkgconfig and not in /usr/lib/pkgconfig"
arch=('x86_64')
url="http://pkgconfig.freedesktop.org/wiki/"
license=('GPL')
depends=('glib2')
source=(https://pkgconfig.freedesktop.org/releases/${_pkgname}-${pkgver}.tar.gz{,.asc})
md5sums=('f6e931e319531b736fadc017f470e68a'
         'SKIP')
validpgpkeys=('6B99CE97F17F48C27F722D71023A4420C7EC6914')  # Dan Nicholson

prepare() {
  cd $_pkgname-$pkgver
  sed -i "s,prefix=/usr$,prefix=/usr/${_target:?}," check/*.pc
  sed -i "s,/usr/include/somedir,/usr/${_target:?}/include/somedir," check/check-*
  sed -i "s,/usr/white\([^s]*\)space,/usr/${_target:?}/white\1space," check/check-whitespace
  sed -i "s,/usr\([/\"]\),/usr/${_target:?}\1," check/check-variable-override
  sed -i "s,/usr/\(include\|lib\),/usr/${_target:?}/\1," check/check-system-flags
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --prefix=/usr/${_target} \
    --target=${_target} \
    --with-system-include-path=/usr/${_target}/include \
    --with-system-library-path=/usr/${_target}/lib \
    --build=$CHOST
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/bin/"
  mv "$pkgdir/usr/${_target}/bin/${CHOST}-pkg-config"  "$pkgdir/usr/bin/${_target}-pkg-config"
}
