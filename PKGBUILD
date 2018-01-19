
pkgname=mingw-w64-p11-kit
pkgver=0.23.9
pkgrel=1
pkgdesc="Library to work with PKCS#11 modules (mingw-w64)"
arch=(any)
url="http://p11-glue.freedesktop.org"
license=('BSD')
depends=('mingw-w64-crt' 'mingw-w64-libtasn1' 'mingw-w64-libffi')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!buildflags' '!strip')
source=($url/releases/p11-kit-$pkgver.tar.gz mingw-p11-kit-setenv.patch)
source=("https://github.com/p11-glue/p11-kit/releases/download/${pkgver}/p11-kit-${pkgver}.tar.gz")
sha256sums=('e1c1649c335107a8d33cf3762eb7f57b2d0681f0c7d8353627293a58d6b4db63')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir"/p11-kit-${pkgver}
}

build() {
  cd "$srcdir"/p11-kit-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-static --disable-silent-rules --disable-trust-module 
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/p11-kit-${pkgver}/build-${_arch}
    make install DESTDIR="$pkgdir"
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -r "$pkgdir"/usr/${_arch}/libexec
    rm -r "$pkgdir"/usr/${_arch}/etc
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

