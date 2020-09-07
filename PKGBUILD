

pkgname=mingw-w64-resource
pkgver=0
pkgrel=2
pkgdesc='support for getrusage (mingw-w64)'
url='http://sourceforge.net/p/mingw-w64/code/HEAD/tree/experimental/getrusage'
arch=('any')
license=('custom')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-gcc' 'subversion')
options=('staticlibs' '!buildflags' '!strip')
source=("sys::svn+https://svn.code.sf.net/p/mingw-w64/code/experimental/getrusage" unmaintained_fields.patch)
md5sums=('SKIP' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd sys
  # http://man7.org/linux/man-pages/man2/getrusage.2.html
  patch -p0 -i "${srcdir}"/unmaintained_fields.patch
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-gcc -I.. -D_FORTIFY_SOURCE=2 -O2 -pipe -fno-plt -fexceptions --param=ssp-buffer-size=4 -c ../sys/getrusage.c -o getrusage.o
    ${_arch}-gcc -shared -o libgetrusage.dll getrusage.o -Wl,--out-implib,libgetrusage.dll.a -Wl,-O1,--sort-common,--as-needed -fstack-protector
    ${_arch}-ar cr libgetrusage.a getrusage.o
    ${_arch}-ranlib libgetrusage.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/build-${_arch}
    install -D -m 644 "${srcdir}"/sys/resource.h "$pkgdir"/usr/${_arch}/include/sys/resource.h
    install -D -m 644 libgetrusage.a "$pkgdir"/usr/${_arch}/lib/libgetrusage.a
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

