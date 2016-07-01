pkgname=mingw-w64-xerces-c
pkgver=3.1.4
pkgrel=1
pkgdesc="A validating XML parser written in a portable subset of C++ (mingw-w64)"
arch=(any)
url="http://xerces.apache.org/xerces-c/"
license=("APACHE")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://apache.osuosl.org/xerces/c/3/sources/xerces-c-${pkgver}.tar.gz"
"001-no-undefined.patch")
md5sums=('21bb097b711a513275379b59757cba4c'
         '65846bed6ac34fdcc2dfbaf6245f37f6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd xerces-c-$pkgver
	patch -p1 -i ../001-no-undefined.patch
  autoreconf -fi
}

build() {
  cd xerces-c-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
			--without-icu \
			--without-curl
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/xerces-c-$pkgver/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
		find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
