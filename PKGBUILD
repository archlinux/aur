# Maintainer: Michał Szymański <smiszym at gmail dot com>

pkgname=mingw-w64-libao
pkgver=1.2.0
pkgrel=1
pkgdesc="Cross-platform audio output library (mingw-w64)"
arch=(any)
url="https://www.xiph.org/ao/"
license=("GPL")
makedepends=(mingw-w64-gcc)
depends=(mingw-w64-crt)
options=(!strip staticlibs !buildflags)
source=("http://downloads.xiph.org/releases/ao/${pkgname#mingw-w64-}-${pkgver}.tar.gz")
md5sums=('9f5dd20d7e95fd0dd72df5353829f097')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd ${pkgname#mingw-w64-}-${pkgver}

  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/configure \
      --host=${_arch}        \
      --prefix=/usr/${_arch} \
      --disable-pulse        \
      --enable-wmm           \
      --enable-static
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done

  install -D -m644 "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
