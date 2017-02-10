# Maintainer: edscott@imp.mx
# Contributor: 

pkgname=mingw-w64-dbh
pkgver=5.0.20
pkgrel=2
pkgdesc="GNU DBH database library (mingw-w64)"
url="http://www.gnu.org/software/libdbh/"
license=('GPL')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'mingw-w64-gettext')
source=("https://sourceforge.net/projects/dbh/files/dbh/${pkgver}/libdbh2-${pkgver}.tar.gz/download"
        0001-remove-lrt.patch)
options=('staticlibs' '!buildflags' '!strip')
md5sums=('b06b504b694e5182f855d642e7dd31af'
        '71f85b3c840b9714366283dd6a87be64')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libdbh2-${pkgver}"

  patch -N -i ../0001-remove-lrt.patch
  autoreconf -vfi
}

build() {
  cd "${srcdir}/libdbh2-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "build-${_arch}" && pushd "build-${_arch}"

    ../configure \
              --prefix=/usr/${_arch} \
              --host=${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libdbh2-${pkgver}/build-$_arch"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a

  done
}
