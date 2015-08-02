
pkgname=mingw-w64-p11-kit
pkgver=0.22.1
pkgrel=1
pkgdesc="Library to work with PKCS#11 modules (mingw-w64)"
arch=(any)
url="http://p11-glue.freedesktop.org"
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-libtasn1' 'mingw-w64-libffi')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=($url/releases/p11-kit-$pkgver.tar.gz mingw-p11-kit-setenv.patch)
md5sums=('4e9bea1106628ffb820bdad24a819fac'
         '51efa37a12ce2843ffc2244baca3c272')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/p11-kit-${pkgver}
  patch -p0 -i "$srcdir"/mingw-p11-kit-setenv.patch
  aclocal --force
  autoreconf -vfi
}

build() {
  cd "$srcdir"/p11-kit-${pkgver}
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-static --disable-silent-rules 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/p11-kit-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

