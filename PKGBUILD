# Maintainer: edubart <edub4rt@gmail.com>
pkgname=mingw-w64-libxdiff
_pkgname=libxdiff
pkgver=0.23
pkgrel=1
pkgdesc="The LibXDiff library implements basic and yet complete functionalities to create file differences/patches"
arch=(any)
url="http://www.xmailserver.org/xdiff-lib.html"
license=('GPL')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc')
options=(!strip !buildflags staticlibs)
source=(http://www.xmailserver.org/$_pkgname-$pkgver.tar.gz)
md5sums=('8970281543130411d8a1b1f004a8418b')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  unset LDFLAGS
  for _arch in ${_architectures}; do
      mkdir -p ${srcdir}/${_pkgname}-${pkgver}-build-${_arch} && cd ${srcdir}/${_pkgname}-${pkgver}-build-${_arch}
      export CFLAGS="-I${srcdir}/${_pkgname}-${pkgver}/xdiff"
      ${srcdir}/${_pkgname}-${pkgver}/configure --prefix=/usr/${_arch} --host=${_arch}
      make
  done
}

package() {
  for _arch in ${_architectures}; do
      cd ${srcdir}/${_pkgname}-${pkgver}-build-${_arch}
      make DESTDIR="$pkgdir" install
      rm -r $pkgdir/usr/${_arch}/share/man
      ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim:set ts=2 sw=2 et: