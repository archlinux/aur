pkgname=mingw-w64-lapackpp
pkgver=2.5.4
pkgrel=0
pkgdesc="C++ library for high performance linear algebra computations. (mingw-w64)"
arch=('any')
url="http://lapackpp.sourceforge.net/"
license=('LGPL')
depends=('mingw-w64-lapack')
makedepends=('mingw-w64-gcc' 'automake-1.11')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://sourceforge.net/projects/lapackpp/files/lapackpp-$pkgver.tar.gz package.patch)
sha256sums=('776c4b2b09412479e1559bcec08a71cfbb162dfbe3f6fbd4da52cef3039cddbc'
            '5196f3de40ed7a5a06d043b1987b89a208141d7a2c7571f930c3e9041d5e15de')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


build() {
    cd "$srcdir/lapackpp-$pkgver"

    # clean MSVC includes
    patch -p1 -i $srcdir/package.patch

    aclocal-1.11
    unset CFLAGS
    unset LDFLAGS

    for _arch in ${_architectures}; do
      mkdir -p build-${_arch}
	    cd build-${_arch}
	    export PKG_CONFIG_PATH="/usr/${_arch}/lib/pkgconfig"

	    ../configure \
        --prefix="/usr/${_arch}" \
        --target="${_arch}" \
        --host="${_arch}"

      # replace dnl macro
      sed -i 's/dnl/#/g' ../configure.ac

      make

      cd ..
    done
}

package() {
  cd lapackpp-$pkgver

  for _arch in ${_architectures}; do
    cd build-${_arch}
    make DESTDIR="$pkgdir" install
    cd ..
  done
}

