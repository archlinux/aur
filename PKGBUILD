pkgname=mingw-w64-libodbc++
pkgver=0.2.5
pkgrel=2
pkgdesc="Libodbc++ is a c++ class library for accessing SQL databases. Include gentoo's fix patch for GCC 4.4. (mingw-w64)"
arch=('any')
url="http://libodbcxx.sourceforge.net/"
license="LGPL"
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
options=('!buildflags' 'staticlibs' '!strip')
source=("http://downloads.sourceforge.net/libodbcxx/libodbc++/libodbc++-${pkgver}.tar.gz"
        'libodbc++-1-win32.patch')
md5sums=('cadc519ef0164e92fe911ae624c985c1'
         '541a56d18fe4b439e2d6fff81a9de3ee')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/libodbc++-$pkgver"

  # mxe patch
  patch -p1 < "$srcdir"/libodbc++-1-win32.patch

  # use -no-undefined to build dll & link to libodbc32 from mingw-crt
  sed -i "s|ldflags=-version-info|ldflags=-no-undefined -lodbc32 -version-info|g" src/Makefile.am

  autoreconf -vfi
}

build() {
  cd "$srcdir/libodbc++-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --without-tests \
      --disable-dependency-tracking
    make doxygen= progref_dist_files=
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/libodbc++-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}