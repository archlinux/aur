pkgname=mingw-w64-lcms2
pkgver=2.7
pkgrel=2
pkgdesc="Small-footprint color management engine, version 2 (mingw-w64)"
arch=(any)
url="http://www.littlecms.com"
license=("MIT")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-libtiff)
options=(staticlibs !strip !buildflags)
source=("http://downloads.sourceforge.net/sourceforge/lcms/lcms2-${pkgver}.tar.gz"
"0002-need-jconfig-before-jmoreconfig.mingw.patch")
md5sums=('06c1626f625424a811fb4b5eb070839d'
         '4017f8307298d6f65e1cb5bce9684fa5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
	cd lcms2-$pkgver
	patch -p1 -i ${srcdir}/0002-need-jconfig-before-jmoreconfig.mingw.patch
	autoreconf -fi
}

build() {
  cd "${srcdir}"/${pkgname#mingw-w64-}-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname#mingw-w64-}-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    find "$pkgdir/usr/${_arch}" -name '*.exe' -exec rm {} \;
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
